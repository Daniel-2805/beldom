class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
    @review = Review.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "services/show"
    end
  end

  def destroy
    @service = @booking.service
    @booking.destroy
    redirect_to service_path(@service)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address_client)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
