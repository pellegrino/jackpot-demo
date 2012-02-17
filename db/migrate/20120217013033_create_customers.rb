class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string   :name
      t.string   :email
     
      t.integer  :jackpot_customer_id 
      t.integer  :jackpot_subscription_id 

      t.timestamps
    end
  end
end
