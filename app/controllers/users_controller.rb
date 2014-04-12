class UsersController < ApplicationController
  skip_before_action :require_login, only: [:login, :new, :create]
  before_action :require_admin, only: [:index, :update]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
  end

  # GET /users/1
  # GET /users/1.json
  def show    
  end

  # GET /users/new
  def new
    @user = User.new
    render template: "users/create"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.username = @user.email;
    
    respond_to do |format|
      if @user.save
        user = User.authenticate_by_email(@user, user_params[:password])
	    session[:user_id] = user.id
        format.html {redirect_to root_path}
  

      else
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  def login
     @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
     if current_user.nil?
         @user = User.new
     end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    u = User.find(params[:id])
    u.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :email, :password_confirmation)
    end
    
end
