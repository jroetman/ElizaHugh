class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session 
  before_filter :set_no_cache
  
  helper_method :current_user, :is_admin, :is_guest, :categories, :item_in_cart, :message_channel
  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    session[:cartitems] ||= Array.new.to_json
    @current_user = session[:user_id] ? User.find(session[:user_id]) : User.new(:user_role => "guest")

  end
  
  def message_channel
      if !session[:message_chan]
          session[:message_chan] = SecureRandom.urlsafe_base64(nil, false)
      end
      session[:message_chan]
  end
  
  def is_admin
    user = User.find_by_id(session[:user_id]) if session[:user_id]
    user.user_role == "admin" if !user.nil?
  end
  
  def is_guest
    current_user.user_role == "guest"
    
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
  
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
end
