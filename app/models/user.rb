class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :activities

  validates :nickname, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@easyread.ly/i, on: :create }

  attr_accessor :current_password

  def avatar_url
    avatar_email = self[:avatar_url].blank? ? email : self[:avatar_url]
    @avatar_url ||= "http://gravatar.com/avatar/#{Digest::MD5::hexdigest(avatar_email).downcase}.png?s=100"
  end
end
