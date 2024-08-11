# Class that represent a user search for wine bottles
class SavedSearch < ApplicationRecord
  scope :for_grape_variety, ->(grape_variety) { where("search_params->>'grape_variety' = ?", grape_variety) }

  belongs_to :user

  validates_presence_of :user
  validates_presence_of :search_params
end
