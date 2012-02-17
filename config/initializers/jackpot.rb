Jackpot.configure do |c|
  if Rails.env.production? or Rails.env.staging?
    c.gateway_type      :braintree
    c.gateway_login     ENV['JACKPOT_LOGIN']
    c.gateway_password  ENV['JACKPOT_PASSWORD']
    c.gateway_mode      :test
  else
    c.gateway_type      :braintree
    c.gateway_login     'login'
    c.gateway_password  'demo'
    c.gateway_mode      :test
  end 
end 
