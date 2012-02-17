class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Jackpot::Subscription.all
  end

  def show
    @subscription = Jackpot::Subscription.find params[:id]
    @customer     = Customer.new(:jackpot_subscription_id => @subscription.id)
  end 
end
