class WelcomeController < ApplicationController
  def index
    @user = User.new
    @specials = Special.all
  end
end
