class User < ApplicationRecord
  has_many :saved_searches

  validates_presence_of :email

  validates :username, presence: true, length: {minimum: 5}
end
