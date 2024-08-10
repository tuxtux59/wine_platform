class PriceHistory < ApplicationRecord
  belongs_to :bottle

  validates_presence_of :price
  validates_presence_of :recorded_at
end
