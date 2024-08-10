class TastingNote < ApplicationRecord
  belongs_to :bottle
  belongs_to :expert

  validates_presence_of :bottle
  validates_presence_of :expert
  validates :score, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 5}
end
