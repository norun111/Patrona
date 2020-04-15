class AddImageToCreators < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :image, :string
    add_column :creators, :cover_image, :string
    add_column :creators, :video, :string
    add_column :creators, :description, :text
  end
end
