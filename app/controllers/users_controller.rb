class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = Service.all
    @booking = Booking.all
    authorize @user

    @users = User.all
  end

  def admin
    @user = User.find(params[:id])
    @user.permission_level = 2
    @user.save
    redirect_to usuario_path(current_user)
    authorize @user
  end

  def owner
    @user = User.find(params[:id])
    @user.permission_level = 1
    @user.save
    redirect_to usuario_path(current_user)
    authorize @user
  end

  def buyer
    @user = User.find(params[:id])
    @user.permission_level = 0
    @user.save
    redirect_to usuario_path(current_user)
    authorize @user
  end
end
