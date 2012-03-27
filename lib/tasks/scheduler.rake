desc "This task is called by the Heroku scheduler add-on"

task :cron => :environment do
  # nightly billing 
  cron = Jackpot::Cron.new(Jackpot::Customer, Rails.logger)
  cron.run
end 


task :clean_database => [:delete_existing_data, 'db:seed']

task :delete_existing_data => :environment do 
  Jackpot::User.delete_all
  Jackpot::Customer.delete_all
  Jackpot::Subscription.delete_all
end 
