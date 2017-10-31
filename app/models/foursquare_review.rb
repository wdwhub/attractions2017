class FoursquareReview < ApplicationRecord
	belongs_to :attraction
	has_many :cached_photos
end
