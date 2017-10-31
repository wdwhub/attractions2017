class AddFoursquareIdToCachedPhoto < ActiveRecord::Migration[5.1]
  def change
    add_reference :cached_photos, :foursquare_review, foreign_key: true
  end
end
