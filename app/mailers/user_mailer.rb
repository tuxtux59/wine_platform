# Basic User mailer class
class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  default from: 'contact@wine_platform.com'

  # def new_bottle(bottle, search)
  def new_bottle
    search = SavedSearch.all.sample
    bottle = Bottle.where(grape_variety: search.search_params['grape_variety']).sample
    deliver_new_bottle(bottle, search)
  end

  def deliver_new_bottle(bottle, search)
    @bottle = bottle
    print("search:\n #{search}\n")
    @search = search
    @user = search.user
    @url = api_bottle_url(bottle, host: 'https://wine_platfom.com')
    mail(
      from: 'alert@wine_platforme.com',
      to: @user.email,
      subject: 'New bottle detected'
    )
  end
end
