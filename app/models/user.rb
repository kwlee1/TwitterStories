class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :username, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { in: 8..30 }
  before_save :email_lowercase
  has_many :stories
  has_many :entries 

  def email_lowercase
    email.downcase!
  end 
end
