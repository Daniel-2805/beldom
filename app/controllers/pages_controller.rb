class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :nosotros, :covid]

  def home
    @services = Service.all
  end
   def nosotros
   end

   def covid
   end 
end
