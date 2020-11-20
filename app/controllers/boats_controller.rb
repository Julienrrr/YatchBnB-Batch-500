class BoatsController < ApplicationController
  def index
    if params[:query].present?
      @boats = policy_scope(Boat.search_by_name_and_boat_model_and_description(params[:query]))
    else
      @boats = policy_scope(Boat)
    end
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
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
    authorize @boat
  end

  def update
    @boat = Boat.find(params[:id])
    authorize @boat
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
    params.require(:boat).permit(:user, :boat_model, :name, :address, :description, :capacity, :price_per_day, :pool, :staff, :spa, :heliport, photos: [])
  end
end
