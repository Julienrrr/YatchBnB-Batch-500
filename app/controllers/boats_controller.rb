class BoatsController < ApplicationController

  def index
    @boats = policy_scope(Boat)
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    authorize @boat
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def edit
    @boat = Boat.find(params[:id])

  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:user, :boat_model, :name, :description, :capacity, :price_per_day, photos: [])
  end
end
