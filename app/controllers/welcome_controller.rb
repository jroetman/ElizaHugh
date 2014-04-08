class WelcomeController < ApplicationController
  def index
    @user = User.new
    @products = Product.limit(5).order("RANDOM()")
    @specials = Special.all
  end
end
