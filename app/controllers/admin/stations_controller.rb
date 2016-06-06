class Admin::StationsController < ApplicationController
  before_action :authenticate_user!
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

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
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
