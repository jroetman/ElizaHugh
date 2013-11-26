class User < ActiveRecord::Base
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.authenticate_by_username(username, password)
    user =  User.where(username: username).take
  
    return user
    #if passhash == password.to_s
    #  print "TRUE!!!!"
    #  user
    #else
    #  print "FALSE!!"
    #  nil
    #end
  end

  def encrypt_password
    if password.present?
      self.password =  BCrypt::Password.create password.to_s
    end
  end

end