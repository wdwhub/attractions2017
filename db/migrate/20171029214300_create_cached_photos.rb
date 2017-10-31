class CreateCachedPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :cached_photos do |t|
    t.integer "height"
    t.integer "created_at_by_epoch"
    t.integer "width"
    t.string "foursquare_venue_id"
    t.string "prefix"
    t.string "suffix"
    t.string "foursquare_user_name"
    t.string "visibility"
    t.string "foursquare_photo_id"
    t.string "user_icon"

      t.timestamps
    end
  end
end
