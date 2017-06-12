class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:new_flight])
    @booking = @flight.bookings.new
    params[:num_passengers].to_i.times do
      @booking.passengers.new
    end
  end

  def create
    @flight = Flight.find(params[:new_flight])
    @booking = @flight.bookings.create
    params[:passenger].each do |pass_number, pass_info|
      @booking.passengers.create(name: pass_info["name"], email: pass_info["email"])
    end
    flash[:success] = "New Booking created"
    @booking.passengers.each do |passenger|
      PassengerMailer.thank_you(passenger).deliver_later
    end
    redirect_to '/'
  end
end
