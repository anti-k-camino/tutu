class Admin::StationsController < Admin::BaseController
  before_action :set_station, only: [:show, :edit, :update, :destroy, :update_station_attributes]
  before_action :set_route, only: [:update_station_attributes]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    
      if @station.save
        redirect_to admin_station_path(@station), notice: 'Станция успешно создана.'
      else
        render :new
      end
    
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    
      if @station.update(station_params)
        redirect_to admin_stations_path, notice: 'Станция успешно изменена.'
      else
        render :edit 
      end
    
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to admin_stations_url, notice: 'Станция успешно удалена.' }
    end
  end

  def update_station_attributes
    @station.update_position_schedule(@route, params[:position], params[:arrival], params[:departing])
    redirect_to [:admin, @route]
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def set_route
    @route = Route.find(params[:route_id])
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
