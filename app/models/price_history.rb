# Class that represent wine bottle's price at a certain date
class PriceHistory < ApplicationRecord
  belongs_to :bottle

  validates_presence_of :recorded_at

  validates :price, presence: true, numericality: { greater_than: 0 }
end
