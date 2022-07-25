class User < ApplicationRecord

  has_many :jwt_blacklists
  has_many :jwt_actives
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :session_limitable


  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.encrypted_password) == plaintext_password
      self
    else
      false
    end
  end
  
end
