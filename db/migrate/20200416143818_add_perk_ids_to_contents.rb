class AddPerkIdsToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :perk_ids, :string
  end
end
