class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string     :image, default: ""
      t.string     :image_title, default: ""
      t.text       :image_description

      t.string     :video
      t.string     :video_url
      t.string     :thumbnail
      t.string     :video_title
      t.text       :video_description
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
