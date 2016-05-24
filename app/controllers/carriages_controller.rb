class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :train_id)
  end
end
