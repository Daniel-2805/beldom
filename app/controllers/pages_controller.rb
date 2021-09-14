class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :nosotros]

  def home
    @services = Service.all
  end

  def nosotros
  end

end
