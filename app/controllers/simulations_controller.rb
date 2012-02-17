class SimulationsController < ApplicationController

  def billing
    customers = Customer.all
    customers.each do |c|
      c.pay_jackpot_subscription 
    end 
    redirect_to root_path, :notice => "Billing did run successfully. 
                                        Check jackpot billing for results"
  end 

end 
