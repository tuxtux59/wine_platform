# To deliver this notification:
#
# BottleNotifier.with(record: @bottle, search:).deliver(search.user)
class BottleNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  required_param :search

  validates :record, presence: true

  def user
    @search.user
  end
end
