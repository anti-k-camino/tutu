class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.required(:route).permit(:name, station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
