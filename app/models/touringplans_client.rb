class TouringplansClient
  attr_accessor :connection, :routes, :permalink
  
  DEFAULT_ROUTES = {
    magic_kingdom: {
      method:   "get",
      path:     "magic-kingdom/attractions"
    },
    epcot: {
      method:   "get",
      path:     "epcot/attractions"
    },
    hollywood_studios: {
      method:   "get",
      path:     "hollywood-studios/attractions"
    },
    animal_kingdom: {
      method:   "get",
      path:     "animal-kingdom/attractions"
    },
    typhoon_lagoon: {
      method:   "get",
      path:     "typhoon-lagoon/attractions"
    },
    blizzard_beach: {
      method:   "get",
      path:     "blizzard-beach/attractions"
    }
  }

  def initialize(connection: TouringplansConnection.new, routes: DEFAULT_ROUTES, permalink: nil)
    @connection = connection
    @routes     = routes
    @permalink  = permalink
  end

  def method_missing(method)
    route_map = routes.fetch(method)
    
    http_method   = route_map.fetch(:method)
    section_path  = route_map.fetch(:path) 
    relative_path = permalink.to_s.size > 0 ? [section_path, permalink].join("/") : section_path
    extension     = ".json"

    # call the connection for records
    connection.connect(http_method: http_method, relative_path: relative_path, extension: extension)
  end
  
  
end