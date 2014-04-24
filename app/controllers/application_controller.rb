class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session 

  
  helper_method :current_user, :is_admin, :is_guest, :categories, :item_in_cart
  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    session[:cartitems] ||= Set.new
    @current_user = session[:user_id] ? User.find(session[:user_id]) : User.new(:user_role => "guest")

  end

  def is_admin
    user = User.find_by_id(session[:user_id]) if session[:user_id]
    user.user_role == "admin" if !user.nil?
  end
  
  def is_guest
    current_user.user_role == "guest"
    
  end
  
  def categories
    @categories = Category.all
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
