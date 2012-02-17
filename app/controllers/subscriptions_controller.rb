class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Jackpot::Subscription.all
  end
end
