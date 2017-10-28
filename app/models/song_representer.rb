class SongRepresenter < Representable::Decorator
  include Representable::JSON

  property :title
  property :track
end
