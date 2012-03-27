# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Plans 
#
ActiveMerchant::Billing::Base.mode = :test
def card_hash(params)
  { 
    :first_name => params[:first_name], 
    :last_name => params[:last_name], 
    :number => params[:number], 
    :month => 1, 
    :year => Date.today.year.next,
    :verification_value => 123
  }
end 

gold = Jackpot::Subscription.create :name => 'Gold',     :description => "Gold Plan",   :price => 3000, :billing_period => 30
silver = Jackpot::Subscription.create :name => 'Silver', :description => "Silver Plan", :price => 2000, :billing_period => 30
bronze = Jackpot::Subscription.create :name => 'Bronze', :description => "Bronze plan", :price => 1000, :billing_period => 30
Rails.logger.info "Subscriptions plans created"

Jackpot::User.create :email => 'test@demo.com', :password => 'jackpot', :password_confirmation => 'jackpot'
Rails.logger.info "Test user created"

# Customers with fake credit cards
john_card = card_hash( :first_name => 'John', :last_name => 'Doe', :number => '5555555555554444')
john_doe = Customer.create :email => 'john@doe.com', 
  :jackpot_subscription_id => gold.id, :credit_card => john_card

Rails.logger.info "John doe created"
tim_card = card_hash(:first_name => 'John', :last_name => 'Doe', :number => '4111111111111111')
tim_armstrong = Customer.create :email => 'tim@armstrong.com', 
  :jackpot_subscription_id => silver.id, :credit_card => tim_card
Rails.logger.info "Tim Armstrong created"

no_subscriber = Customer.create :email => 'not@alover.com', 
  :jackpot_subscription_id => nil, :credit_card => tim_card
Rails.logger.info "No Subscriber created"

