class FoursquareReview < ApplicationRecord
	
	belongs_to :attraction
	has_many :cached_photos, :dependent => :destroy

def find_cached_images
  cached_photos = CachedPhoto.where("foursquare_venue_id = ?", foursquare_id)
end

end
