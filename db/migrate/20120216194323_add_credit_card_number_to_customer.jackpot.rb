# This migration comes from jackpot (originally 20120104164830)
class AddCreditCardNumberToCustomer < ActiveRecord::Migration
  def change
    add_column :jackpot_customers, :credit_card_number, :string
  end
end
