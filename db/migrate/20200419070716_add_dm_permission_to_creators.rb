class AddDmPermissionToCreators < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :dm_permission, :integer, default:1
  end
end
