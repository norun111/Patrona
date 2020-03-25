class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string     :video, null: false
      t.string     :video_url, null: false
      t.string     :image, null: false
      t.string     :title, null: false
      t.text       :description, null: false
      
      

      t.timestamps
    end
  end
end
