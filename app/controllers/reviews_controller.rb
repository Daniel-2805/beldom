class ReviewsController < ApplicationController

  def show; end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to booking_path(@booking)
    else
      redirect_to booking_path(@booking)
    end
  end

  def destroy; end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
