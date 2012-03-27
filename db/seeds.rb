# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Plans 
#
ActiveMerchant::Billing::Base.mode = :test
def card(params)
  Jackpot::Card.new(:first_name => params[:first_name], 
                    :last_name => params[:last_name], 
                    :number => params[:number], 
                    :month => 1, 
                    :year => Date.today.year.next,
                    :verification_value => 123)
end 

Jackpot::Subscription.create :name => 'Gold',   :price => 30, :billing_period => 30
Jackpot::Subscription.create :name => 'Silver', :price => 20, :billing_period => 30
Jackpot::Subscription.create :name => 'Bronze', :price => 10, :billing_period => 30
Rails.logger.info "Subscriptions plans created"

Jackpot::User.create :email => 'test@demo.com', :password => 'jackpot', :password_confirmation => 'jackpot'
Rails.logger.info "Test user created"

# Customers with fake credit cards

john_doe = Jackpot::Customer.create :email => 'john@doe.com', :description => 'Great customer'
john_doe.update_credit_card card(:first_name => 'John', :last_name => 'Doe', :number => '5555555555554444')
Rails.logger.info "John doe created"

tim_armstrong = Jackpot::Customer.create :email => 'tim@armstrong.com', :description => 'Old school client'
tim_armstrong.update_credit_card card(:first_name => 'Tim', :last_name => 'Armstrong', :number => '4111111111111111')

Rails.logger.info "Tim Armstrong created"
