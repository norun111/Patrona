class CreateContentPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :content_perks do |t|
      t.references :content, index: true, foreign_key: true
      t.references :perk, index: true, foreign_key: true

      t.timestamps
    end
  end
end
