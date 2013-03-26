class ContactMailer < ActionMailer::Base
  default to: ENV["CONTACT_EMAIL"]

  def private_email(message)
    @message = message
    mail from: @message.email, subject: @message.subject
  end
end
