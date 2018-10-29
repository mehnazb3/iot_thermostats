class Api::V1::ReadingsController < ApiController
  before_action :set_reading, only: [:show, :update, :destroy]

  # GET /readings
  def index
    @readings = Reading.all

    render json: @readings
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
