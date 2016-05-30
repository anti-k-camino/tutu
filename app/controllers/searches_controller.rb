class SearchesController < ApplicationController

  def new 
  end

  def show
    @routes = Route.search(params[:search_begin], params[:search_end])
  end

end