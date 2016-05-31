class SearchesController < ApplicationController

  def new 
  end

  def show
    @routes = Route.search(params[:search_begin][:station_id], params[:search_end][:station_id])
  end

end