class SubscriberMailer < ApplicationMailer
  def welcome_email
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: 'Welcome to Greg and the Holy Rails Blog!')
  end
end
