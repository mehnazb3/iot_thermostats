class Api::V1::ReadingsController < ApiBaseController

  # load_and_authorize_resource only: [:index, :show, :create]
  before_action :validate_thermostat
  before_action :set_reading, only: [:show]

  swagger_controller :readings, 'Reading management'

  swagger_api :index do
    summary 'Returns all Readings'
    notes 'Notes...'
  end

  # GET /readings
  def index
    @readings = @thermo_stat.readings
    render json: @readings
  end

  swagger_api :show do
    summary 'Shows a Readings'
    notes 'Shows a Readings'
    param :path, :id, :integer, :required, 'Reading ID'
    response :ok
    response :unauthorized
    response :bad_request
  end

  # GET /readings/1
  def show
    render json: @reading
  end

  swagger_api :create do
    summary 'Reading create action'
    notes 'Creates a Reading'
    param :form, :"reading[temperature]", :float, :required, 'Temperature'
    param :form, :"reading[humidity]", :float, :required, 'Humidity'
    param :form, :"reading[battery_charge]", :float, :required, 'Battery Charge'
    response :created
    response :unauthorized
    response :bad_request
  end

  # POST /readings
  def create
    if validate_reading_params
      number = @thermo_stat.reading_count.increment
      reading_data = { temperature: params[:reading][:temperature],
        humidity: params[:reading][:humidity],
        battery_charge:  params[:reading][:battery_charge]
      }
      @thermo_stat.unsaved_readings["#{number}"] = reading_data
      ReadingProcessorWorker.perform_async(@thermo_stat.id, number)
      render_success_json_with_number(number)
    else
      render json: @reading.errors, status: :unprocessable_entity
    end
  end

  private

    def validate_thermostat
      @thermo_stat = ThermoStat.from_api_key(request.env["HTTP_X_API_KEY"])
      render_error_state('Unauthorized', :unauthorized) if @thermo_stat.blank?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    def validate_reading_params
      # p "Yet to work on this"
    end

    def render_success_json_with_number(number, status = :created)
      render json: { reading_id: number }, status: status
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:number, :temperature, :humidity, :battery_charge)
    end
end
