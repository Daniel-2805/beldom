class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = Service.all
    @booking = Booking.all
    authorize @user
  end
end
