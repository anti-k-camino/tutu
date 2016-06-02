class SearchesController < ApplicationController
  def new
  end

  def show
    @routes = Route.search(params[:search][:start_id], params[:search][:finish_id])
  end
end
