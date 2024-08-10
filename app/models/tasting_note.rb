class TastingNote < ApplicationRecord
  belongs_to :bottle
  belongs_to :expert

  validates_presence_of :bottle
  validates_presence_of :expert
  validates_presence_of :score
end
