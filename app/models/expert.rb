class Expert < ApplicationRecord
  has_many :tasting_notes

  validates_presence_of :username
  validates_presence_of :email
end
