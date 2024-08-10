class Expert < ApplicationRecord
  has_many :tasting_notes

  validates_presence_of :email

  validates :username, presence: true, length: {minimum: 5}
end
