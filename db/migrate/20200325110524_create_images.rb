class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :description, null: false
      t.timestamps
    end
  end
end
