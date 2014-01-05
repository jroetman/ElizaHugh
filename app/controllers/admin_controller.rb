class AdminController < ApplicationController
  def index
     current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
     
     if current_user.nil?
         @user = User.new
         render :partial => "/users/login", :layout => false
     end
     
  end
  
  def specials
    @specials = Special.all
    render :partial => "specials", :layout => false, :locals =>{:specials =>@specials}
    
  end
  
  def products
    @products = Product.all
    @product = Product.new
    render :partial => "products", :layout => false, :locals => {:products => @products}
    
  end
end
