class SearchesController < ApplicationController

  def new 
  end

  def show
    @routes = Route.search(params[:search][:start_id], params[:search][:finish_id])
    #redirect_to show_path(params[:search_begin][:station_id],params[:search_end][:station_id])
  end

end