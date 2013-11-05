class WelcomeController < ApplicationController
  def index
    @specials = Special.all
  end
end
