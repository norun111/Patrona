class AddBackingsCountToPerks < ActiveRecord::Migration[5.2]
  def change
    add_column :perks, :backings_count, :integer, default:0
  end
end
