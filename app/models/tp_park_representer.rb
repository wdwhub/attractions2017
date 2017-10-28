class TpParkRepresenter < Representable::Decorator
  include Representable::JSON

  property :name

  collection :attractions, class: AttractionRepresentation do
    property :name
    property :short_name
    property :permalink
  end
end