class AuthenticationController < ApplicationController
  skip_before_action :require_login
  
  def sign_in
    @user = User.new
  end

  def login
    email = params[:user][:email]
    password = params[:user][:password]
    
    user = User.find_by_email(email)
  
    if user.nil?
      redirect_to :back, :flash => {:error => "Email or Password Incorrect"}
    
    else 
	    user = User.authenticate_by_email(user, password)
	    
	    if user
	      session[:user_id] = user.id
	     
	      session[:cartitems] = JSON::parse(Cart.find_by_user_id(user.id).cart_json) 
	      session[:cartitems] ||= Set.new
	     
	      redirect_to root_path
	      
	    else
	      redirect_to :back, :flash => {:error => "Email or Password Incorrect"}
	      
	    end
	 end
 end
 
 def logout
    reset_session 
    redirect_to root_url
 end
 
end
