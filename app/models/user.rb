class User < ApplicationRecord
  has_many :saved_searches

  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP

  validates :username, presence: true, length: {minimum: 5}
end
