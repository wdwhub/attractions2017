class FoursquareVenuePhoto
  attr_reader :client, :venue_id, :routes, :connection

    # attr_reader :connection

  # def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{verified: true}))
  #   @connection       = connection
  #   client      = FoursquareClient.new(connection: connection, routes: routes)
  # end
  
  
  def initialize(venue_id:, connection: FoursquareConnection.new(api_version: '20160607', query:{verified: true}))
    venue_id    = @venue_id
    connection  = @connection
    routes      = FoursquareRoutes.routes(venue_id)
    client      = FoursquareClient.new(connection: connection, routes: routes)
  end
  
  def title 
    "foursquare2 photo"
  end
  
  def venue_photos(venue_id)
    array_of_hashed_details  = client.venue_photos.fetch('items', ['no results'])
    # photos      = array_of_hashed_details.collect {|item| OpenStruct.new(item) }
    
  end
end
