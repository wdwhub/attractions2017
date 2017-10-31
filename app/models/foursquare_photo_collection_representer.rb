class FoursquarePhotoCollectionRepresenter < Representable::Decorator
  include Representable::JSON


  collection :items, class: FoursquarePhotoRepresentation do
    property :id
    property :created_at
    collection 	:source, class: FoursquareSourceRepresentation do
      property  :name
      property  :url    	
    end
    property :prefix
    property :suffix
    property :width
    property :height
    property :user
  end
end