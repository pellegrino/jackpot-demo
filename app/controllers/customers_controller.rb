class CustomersController < ApplicationController
  def create
    @customer = Customer.create(params[:customer])
    if @customer 
      redirect_to @customer, :notice => "Customer created successfully"
    end 

  end

  def show
    @customer = Customer.find params[:id]
  end
end
