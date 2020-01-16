class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :posts
  has_many :comments
  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
