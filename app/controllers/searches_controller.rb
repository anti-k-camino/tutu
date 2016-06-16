class SearchesController < ApplicationController
  
  before_action :load_stations, only: [:show]

  def new
    @stations = Station.all
  end

  def show
    @routes = Route.search(params[:start_station], params[:finish_station])
  end

  private

  def load_stations
    @start = Station.find(params[:start_station])
    @finish = Station.find(params[:finish_station])
  end
end
