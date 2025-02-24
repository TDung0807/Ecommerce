require 'jwt'

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_one :cart, dependent: :destroy
  def generate_jwt
    payload = { user_id: id, exp: 7.days.from_now.to_i }
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
