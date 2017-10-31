class AddFoursquareUserIdToCachedPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :cached_photos, :foursquare_user_id, :integer
  end
end
