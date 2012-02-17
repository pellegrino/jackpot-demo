# This migration comes from jackpot (originally 20120216215624)
class AddDescriptionToJackpotSubscriptions < ActiveRecord::Migration
  def change
    add_column :jackpot_subscriptions, :description, :text
  end
end
