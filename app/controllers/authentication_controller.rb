class AuthenticationController < ApplicationController
  
  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]
    
    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
      
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
      
    end

    if user
      session[:user_id] = user.id
     
    else
      
      
    end
    
     redirect_to root_url 
 end
 
 def logout
    session[:user_id] = nil 
    redirect_to root_url
 end
 
end
