class CreateTiers < ActiveRecord::Migration[5.2]
  def change
    create_table :tiers do |t|
      t.decimal    :price,    null: false, precision: 8
      t.string     :title,                  null: false
      t.text       :description,            null: false
      t.string     :image
      t.timestamps
    end
  end
end
