class BookingsController < ApplicationController

def index
  current_user.bookings
end

def new
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new
end

def create
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.boat = @boat
   if @booking.save
     redirect_to boats_path(@boat)
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
    redirect_to boat_bookings_path(@boat)
end

private

def booking_params
    params.require(:booking).permit(:start_date, :end_date, :duration)
end

end
