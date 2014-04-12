class WelcomeController < ApplicationController
  skip_before_action :require_login
  
  def index
    @user = User.new
    @products = Product.limit(5).order("RANDOM()")
    @specials = Special.all
  end
end
