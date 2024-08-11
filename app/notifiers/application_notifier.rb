# Noticed Event class
class ApplicationNotifier < Noticed::Event
  deliver_by :email do |config|
    config.mailer = 'UserMailer'
    config.method = 'new_bottle'
    config.params -> { [record, search] }
    config.args -> { [record, search] }
  end
end
