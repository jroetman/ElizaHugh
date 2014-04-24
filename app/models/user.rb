class User < ActiveRecord::Base
  def after_initialize
    if !session[:cartitems]
        session[:cartitems] = Array.new
    end
    
  end
  
  has_many :products,  through: :cartitems, foreign_key: "productid"
   
  before_save :encrypt_password
  validates :password, :confirmation =>  {message: "Passwords don't match"}
  validates :password_confirmation, :presence => {message: "Password confirmation required"}
  validates :password, :presence => {message: "Password required"}
  validates_presence_of :email, message: "Email required"
  validates :email, format: {message: "Email is invalid", with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email, message: "Email address already taken"
  
  
  def self.authenticate_by_email(user, password)
    if BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password =  BCrypt::Password.create password
    end
  end
  
end