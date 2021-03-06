class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  # devise :registerable, :database_authenticatable, :recoverable,
  #       :rememberable, :trackable, :validatable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password
end
