class User < ActiveRecord::Base
  has_secure_password
  validates :nickname, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@easyread.ly/i, on: :create }

  attr_accessor :current_password
end
