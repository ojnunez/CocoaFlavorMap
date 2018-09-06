class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.references :country
      t.references :producer
      t.string :name
      t.string :long_name
      t.string :description
      t.string :latitude
      t.string :longitude
      t.text :content_left
      t.text :content_right
      t.attachment :main_image
      t.string :youtube_url
      t.timestamps
    end
  end
end
