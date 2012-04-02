# This migration comes from jackpot (originally 20120402183515)
class AddPublicTokenToJackpotPayments < ActiveRecord::Migration
  def change
    add_column :jackpot_payments, :public_token, :string
    add_index  :jackpot_payments, :public_token
  end
end
