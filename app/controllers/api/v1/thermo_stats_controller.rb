class Api::V1::ThermoStatsController < ApiController
  before_action :set_thermo_stat, only: [:show, :update, :destroy]

  respond_to :json

  swagger_controller :thermo_stats, 'ThermoStats'

  swagger_api :index do
    summary 'Returns all Thermostats'
    notes 'Notes...'
  end

  # GET /thermo_stats
  def index
    @thermo_stats = ThermoStat.all

    render json: @thermo_stats, status: :ok
  end

  # GET /thermo_stats/1
  def show
    render json: @thermo_stat
  end

  # POST /thermo_stats
  def create
    @thermo_stat = ThermoStat.new(thermo_stat_params)

    if @thermo_stat.save
      render json: @thermo_stat, status: :created, location: @thermo_stat
    else
      render json: @thermo_stat.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_thermo_stat
    @thermo_stat = ThermoStat.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def thermo_stat_params
    params.require(:thermo_stat).permit(:household_token, :location)
  end
end
