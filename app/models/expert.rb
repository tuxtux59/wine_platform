# Class that represent entity that can note a bottle
class Expert < ApplicationRecord
  has_many :tasting_notes

  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP

  validates :username, presence: true, length: { minimum: 5 }
end
