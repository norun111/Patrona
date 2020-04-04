class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body,                           null: false
      t.references :user, foreign_key: true
      t.references :creator, foreign_key: true
      t.string :creator_name
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
