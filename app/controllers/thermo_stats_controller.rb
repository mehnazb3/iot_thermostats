class ThermoStatsController < ApplicationController
  before_action :set_thermo_stat, only: [:show, :update, :destroy]

  # GET /thermo_stats
  def index
    @thermo_stats = ThermoStat.all

    render json: @thermo_stats
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

  # PATCH/PUT /thermo_stats/1
  def update
    if @thermo_stat.update(thermo_stat_params)
      render json: @thermo_stat
    else
      render json: @thermo_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thermo_stats/1
  def destroy
    @thermo_stat.destroy
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
