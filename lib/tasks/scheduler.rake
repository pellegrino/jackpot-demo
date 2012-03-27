desc "This task is called by the Heroku scheduler add-on"

task :cron => :environment do
  # nightly billing 
  cron = Jackpot::Cron.new(Jackpot::Customer, Rails.logger)
  cron.run
end 


task :clean_database => [ 'db:schema:load', 'db:seed' ]
