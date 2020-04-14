class AddPerkSubscriptionsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :perk_subscriptions, :text
  end
end
