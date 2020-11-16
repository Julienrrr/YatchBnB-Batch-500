class BookingsController < ApplicationController

# def index
# @bookings = Booking.where
# end

def new
    @booking = Booking.new
end

def create
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new(booking_params)
  @booking.boat = @boat
  @booking.save
    if @booking.save
      redirect_to boat_path(@boat)
    else 
      render :new
    end
end

def edit
    @booking = Booking.find(params[:id])
end

def update
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.find(params[:id])
  @booking.update(booking_params)
  redirect_to boat_path(@boat)
end

def destroy
    @booking = Booking.find(params[:id])
    @boat = @booking.boat
    @booking.destroy
    redirect_to boat_path(@boat)
end

private

def booking_params
    params.require(:booking).permit(:start_date, :end_date)
end

end
