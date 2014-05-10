class WelcomeController < ApplicationController
  skip_before_action :require_login
  
  def index
    @products = Product.limit(5).order("RANDOM()")
    @specials = Special.all.order(:id)

  end
  
  def terms
  end
end
