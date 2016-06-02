class SearchesController < ApplicationController
  before_action :load_stations, only:[:show]

  def new
  end

  def show
    @routes = Route.search(params[:search][:start_id], params[:search][:finish_id])    
  end

 # def arrival
 # end 
 # def departing
 # end

  private
  def load_stations
    @start = Station.find(params[:search][:start_id])
    @finish = Station.find(params[:search][:finish_id])
  end
  #private
  #def start_params
  #  params.require(:search).permit(:start_id)
  #end

  #def finish_params
  # params.require(:search).permit(:finish_id)
  #end
end
