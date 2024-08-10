class TastingNote < ApplicationRecord
  belongs_to :bottle
  belongs_to :expert
end
