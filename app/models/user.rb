class User < ApplicationRecord
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :session_limitable

  # attr_accessor :password

  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.encrypted_password) == plaintext_password
      self
    else
      false
    end
  end
  
end
