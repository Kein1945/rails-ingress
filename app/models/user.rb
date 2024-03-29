class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable#, :omniauth_providers => [:google_apps]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :accessible
  
  has_and_belongs_to_many :permissions, :join_table => :users_permissions
  belongs_to :player
  # attr_accessible :title, :body

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
	if user = User.where(:email => data["email"]).first
	  user
	else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end
  
  private
  def mass_assignment_authorizer(role = :default)
    super + (accessible || [])
  end
end
