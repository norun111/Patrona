class AddFieldsToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :current_donational_amount, :integer, default: 0
    add_column :perks, :status, :string, default: "active"
  end
end
