class ServicesController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.current_user = user
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :category, :description, :price)
  end
end
