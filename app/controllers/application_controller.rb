class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session 
  before_action :require_login
  
  helper_method :current_user, :is_admin, :categories, :item_in_cart
  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def is_admin
    user = User.find_by_id(session[:user_id]) if session[:user_id]
    user.user_role == "admin"
   
  end

  def categories
    @categories = Category.all
  end
  
  def item_in_cart(product)
     Cartitem.exists?(userid: current_user.id, productid: product.id)
     
  end
  
  
  private
  
  def require_login
    user = User.find_by_id(session[:user_id]) 

    unless !user.nil?
      redirect_to root_path	
    end
  end
  
  def require_admin
    user = User.find_by_id(session[:user_id]) 

    unless !user.nil? && user.user_role == "admin"
      redirect_to root_path	
    end
  end 
  
end
