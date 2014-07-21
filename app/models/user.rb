class User < ActiveRecord::Base

  has_many :posts
  has_many :sessions
  has_many :comments
  has_many :assignments
  has_many :roles, :through => :assignments

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  has_secure_password
  attr_accessor :username_or_email

  validates :name, :presence => true, :length => { :in => 2..30 }
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX, :length => { :in => 6 .. 100 }
  validates :password, :presence => true, :length => { :in => 6..20 }, :on => :create
  validates :password, :confirmation => true, :unless => "password.blank?"  #password_confirmation attr
  validates :role_id, :presence => true
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

end
