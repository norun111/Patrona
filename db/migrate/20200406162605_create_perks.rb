class CreatePerks < ActiveRecord::Migration[5.2]
  def change
    create_table :perks do |t|
      t.string :title, null:false
      t.decimal :amount, precision: 8, default: 0, null:false
      t.text :description, null:false
      t.string     :image
      t.references :creator, foreign_key: true, null:false

      t.timestamps
    end
  end
end
