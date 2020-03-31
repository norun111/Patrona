class AddIndexToCreators < ActiveRecord::Migration[5.2]
  def change
    add_index :creators, :creator_name
  end
end
