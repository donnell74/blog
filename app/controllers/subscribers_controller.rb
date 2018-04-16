class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      SubscriberMailer.with(subscriber: @subscriber).welcome_email.deliver_later
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
