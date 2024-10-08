# Class representing wine bottle
class Bottle < ApplicationRecord
  after_create :notify_users

  has_many :tasting_notes
  has_many :price_histories

  validates_presence_of :vintage

  validates :name, presence: true, length: { minimum: 10 }
  validates :grape_variety, presence: true, length: { minimum: 5 }
  validates :sale_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :thumb, format: { with: URI::DEFAULT_PARSER.make_regexp }

  def average_score
    tasting_notes.average(:score)
  end

  def latest_price
    latest_history = price_histories.order(recorded_at: :desc).first
    latest_history&.price
  end

  private

  def notify_users
    # TODO: handle noticed gem
    SavedSearch
      .for_grape_variety(grape_variety)
      .find_each do |search|
        BottleNotifier.with(record: self, search:).deliver(search.user)
      end
  end
end
