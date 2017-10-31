class AddSourceToCachedPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :cached_photos, :source, :text
  end
end
