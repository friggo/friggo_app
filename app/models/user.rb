class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook]

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :products
	# attr_accessible :title, :body

	# Arranges for the dependent products (i.e., the ones belonging to the given user) 
	# to be destroyed when the user itself is destroyed. 
	# This prevents userless products from being stranded in the database when 
	# admins choose to remove users from the system.
	has_many :products, dependent: :destroy

	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    user.email = data["email"] if user.email.blank?
		  end
		end
	end

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(  provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20]
	                         )
	  end
	  user
	end  
end
