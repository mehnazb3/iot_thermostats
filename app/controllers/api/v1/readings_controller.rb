class Api::V1::ReadingsController < Api::V1::ApiController
  
  load_and_authorize_resource only: [:index, :show, :create]
  before_action :set_reading, only: [:show]

  swagger_controller :readings, 'Reading management'

  swagger_api :index do
    summary 'Returns all Readings'
    notes 'Notes...'
  end

  # GET /readings
  def index
    @readings = Reading.all

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

  # POST /readings
  def create
    @reading = Reading.new(reading_params)

    if @reading.save
      render json: @reading, status: :created, location: @reading
    else
      render json: @reading.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:thermostat_id, :number, :temperature, :humidity, :battery_charge)
    end
end
