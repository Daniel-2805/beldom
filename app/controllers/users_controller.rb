class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = Service.all
    @booking = Booking.geocoded
    
    @markers= @booking.map do |booking|
      { lat: booking.latitude, lng: booking.longitude }
    end
    authorize @user

  end

  def search
    @user = User.find(params[:id])
    @services = Service.all
    @booking = Booking.near(params[:query],10)
    
    @markers= @booking.map do |booking|
      { lat: booking.latitude, lng: booking.longitude }
    end
    authorize @user

  end
end
