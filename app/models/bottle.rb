class Bottle < ApplicationRecord
  has_many :tasting_notes
  has_many :price_histories

  def average_score
    tasting_notes.average(:score)
  end

  def latest_price
    latest_history = price_histories.order(recorded_at: :desc).first
    latest_history.price if latest_history
  end
end
