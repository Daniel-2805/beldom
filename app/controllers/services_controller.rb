class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = policy_scope(Service).order(created_at: :desc)
  end

  def show
        @booking = Booking.new
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    @service.user = current_user
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:title, :category, :description, :price)
  end

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end 
end
