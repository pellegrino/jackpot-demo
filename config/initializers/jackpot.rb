Jackpot.configure do |c|
  if Rails.env.production? or Rails.env.staging?
    c.gateway_type      :braintree
    c.gateway_login     ENV['JACKPOT_LOGIN']
    c.gateway_password  ENV['JACKPOT_PASSWORD']
    c.gateway_mode      :test
  else
    c.gateway_type      :braintree
    c.gateway_login     'demo'
    c.gateway_password  'password'
    c.gateway_mode      :test
  end 
end 
