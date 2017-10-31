class AddPhotographerLastNameToCachedPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :cached_photos, :photographer_last_name, :string
  end
end
