class AddPhotographerFirstNameToCachedPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :cached_photos, :photographer_first_name, :string
  end
end
