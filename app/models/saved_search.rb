class SavedSearch < ApplicationRecord
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :search_params
end
