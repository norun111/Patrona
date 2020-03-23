class CreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators do |t|
      t.boolean :podcasts           ,default: false
      t.boolean :videos             ,default: false
      t.boolean :music              ,default: false
      t.integer :restriction, default: 0

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
