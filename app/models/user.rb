class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :products
  # attr_accessible :title, :body

  # Arranges for the dependent microposts (i.e., the ones belonging to the given user) 
  # to be destroyed when the user itself is destroyed. 
  # This prevents userless products from being stranded in the database when 
  # admins choose to remove users from the system.
  has_many :products, dependent: :destroy
end
