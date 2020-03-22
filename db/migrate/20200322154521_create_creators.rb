class CreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators do |t|
      t.boolean :podcasts           ,default: false
      t.boolean :videos             ,default: false
      t.boolean :music              ,default: false
      t.boolean :no                 ,default: false
      t.boolean :prohibited         ,default: false
      t.timestamps
    end
  end
end
