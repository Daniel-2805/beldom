class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :nosotros]

  def home
  end
   def nosotros
   end
end
