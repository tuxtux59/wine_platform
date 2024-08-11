# Preview all emails at http://localhost:3000/rails/mailers/user_mailer_mailer
class UserMailerPreview < ActionMailer::Preview
  def send_new_bottle_email
    user = User.new(username: 'username', email: 'user@example.com')
    bottle = Bottle.all.sample
    saved_search = SavedSearch.new(search_params: { grape_variety: bottle.grape_variety }, user:)

    UserMailer.new_bottle(bottle, saved_search)
  end
end
