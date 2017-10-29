class AddAttractionIdToFoursquareReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :foursquare_reviews, :attraction, foreign_key: true
  end
end
