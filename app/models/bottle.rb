class Bottle < ApplicationRecord
  has_many :tasting_notes
  has_many :price_histories

  validates_presence_of :vintage
  validates_presence_of :sale_url

  validates :name, presence: true, length: {minimum: 10}
  validates :grape_variety, presence: true, length: {minimum: 5}

  def average_score
    tasting_notes.average(:score)
  end

  def latest_price
    latest_history = price_histories.order(recorded_at: :desc).first
    latest_history.price if latest_history
  end
end
