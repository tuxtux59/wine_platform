class User < ApplicationRecord
  has_many :saved_searches

  validates_presence_of :username
  validates_presence_of :email
end
