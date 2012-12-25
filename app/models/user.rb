class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :name, :email, :password, :password_confirmation
  # has_secure_password
  # validates_presence_of :name

  # before_save { |user| user.email = user.email.downcase }
  # before_save :create_remember_token
  
  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      # binding.pry
      user
    else
      # binding.pry
      User.create!(name: data["name"], :email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  # validates :name, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false}
  # validates :password, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  # private 
  #   def create_remember_token
  #     self.remember_token = SecureRandom.urlsafe_base64
  #   end

end