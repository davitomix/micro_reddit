class User < ApplicationRecord
  has_many :posts
  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
end
