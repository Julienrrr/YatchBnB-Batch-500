class BookingsController < ApplicationController
def index
  @bookings = policy_scope(Booking)
end

def new
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new
  authorize @booking
end

def create
  @boat = Boat.find(params[:boat_id])
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.boat = @boat
  authorize @booking
  if @booking.save
    redirect_to bookings_path
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
  authorize @booking
  @booking.update(booking_params)
  redirect_to boat_path(@boat)
end

def destroy
  @booking = Booking.find(params[:id])
  authorize @booking
  @booking.destroy
  redirect_to bookings_path
end

def update_status
  @booking = Booking.find(params[:id])
  @booking.update(status:params[:status])
  skip_authorization
  redirect_to dashboard_path
end


private

def booking_params
  params.require(:booking).permit(:start_date, :end_date,)
end
end
