class PassengerMailer < ApplicationMailer

  def thank_you(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    @flight = @booking.flight
    mail(to: @passenger.email, subject: "Thank you for booking your flight")
  end
end
