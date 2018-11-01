class Api::V1::ReadingsController < ApiBaseController

  # load_and_authorize_resource only: [:index, :show, :create]
  before_action :validate_thermostat
  # before_action :set_reading, only: [:show]

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

  swagger_api :create do
    summary 'Reading create action'
    notes 'Creates a Reading'
    param :form, :"reading[temperature]", :number, :required, 'Temperature'
    param :form, :"reading[humidity]", :number, :required, 'Humidity'
    param :form, :"reading[battery_charge]", :number, :required, 'Battery Charge'
    response :created
    response :unauthorized
    response :bad_request
  end

  # POST /readings
  def create
    if validate_reading_params(params[:reading])
      number = @thermo_stat.reading_count.increment
      reading_data = clean_up_params(params[:reading],[:temperature, :humidity, :battery_charge])
      @thermo_stat.unsaved_readings["#{number}"] = reading_data
      # Background worker to save Reading
      ReadingProcessorWorker.perform_async(@thermo_stat.id, number)
      render_success_json_with_number(number)
    else
      render_error_state('Invalid Input', :bad_request)
    end
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
    params[:reading_id] ||= params[:id]
    if params[:reading_id].present?
      @reading = @thermo_stat.readings.where(number: params[:reading_id]).first || @thermo_stat.unsaved_readings["#{params[:reading_id]}"]
      render json: @reading
    else
      render_error_state('Invalid Input', :bad_request)
    end
  end

  private

    def validate_thermostat
      @thermo_stat = ThermoStat.from_api_key(request.env["HTTP_X_API_KEY"])
      render_error_state('Unauthorized', :unauthorized) if @thermo_stat.blank?
    end

    def validate_reading_params(reading)
      # p "Yet to work on this"
      reading.present? &&
        [:temperature, :humidity, :battery_charge].select{|a| reading[a].present? && valid_float?(reading[a]) }.count == 3
    end

    def render_success_json_with_number(number, status = :created)
      render json: { reading_id: number }, status: status
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:number, :temperature, :humidity, :battery_charge)
    end
end
