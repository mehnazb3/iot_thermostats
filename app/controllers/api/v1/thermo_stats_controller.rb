class Api::V1::ThermoStatsController < Api::V1::ApiController
  # load_and_authorize_resource only: [:index, :show, :create]
  before_action :set_thermo_stat, only: [:show]

  # respond_to :json

  swagger_controller :thermo_stats, 'ThermoStats management'

  swagger_api :index do
    summary 'Returns all Thermostats'
    notes 'Notes...'
  end

  # GET /thermo_stats
  def index
    @thermo_stats = ThermoStat.all
    render json: @thermo_stats, status: :ok
  end

  swagger_api :index do
    summary 'Returns all Thermostats'
    notes 'Notes...'
  end

  swagger_api :show do
    summary 'Shows a micro-blog'
    notes 'Shows a thermo-stat with token and possible actions'
    param :path, :id, :integer, :required, 'Thermo-stat ID'
    response :ok
    response :unauthorized
    response :bad_request
  end

  # GET /thermo_stats/1
  def show
    render json: @thermo_stat
  end



  swagger_api :create do
    summary 'Thermo-stat create action'
    notes 'Creates a Thermo-stat'
    param :form, :"thermo_stat[message]", :string, :required, 'Message of the micro-blog'
    response :created
    response :unauthorized
    response :bad_request
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
