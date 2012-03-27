desc "This task is called by the Heroku scheduler add-on"

task :cron => :environment do
  Customer.all.each do |c|
    c.pay_jackpot_subscription if c.subscription.present? 
  end 
end 

task :clean_database => [:delete_existing_data, 'db:seed']

task :delete_existing_data => :environment do 
  Jackpot::User.delete_all
  Jackpot::Customer.delete_all
  Jackpot::Subscription.delete_all

  Customer.delete_all
end 
