# require_relative "./representations/attraction"

class TouringplansSync
  
  attr_accessor :client, :routes, :venue_default

  def initialize(client: TouringplansClient.new, routes: TouringplansClient.new.routes)
    @client         = client
    @routes         = routes
    @venue_default  = TouringplansMissingVenue.new
  end

  def title
    "I am touring plans park sync"
  end
  
  def update_all_cached_touringplans_venues
    client.routes.keys.each { |route| update_park_venues(park_route_key: route) }
  end
  def update_park_venues(park_route_key:)
    park_venue_routes = generate_list_of_routes_of_attractions_in_a_park(park_route: park_route_key)
    # list.collect { |venue| venue.name }
    venues = Hash.new
    venues["park_route"]  = park_route_key
    venues["attractions"] = []
    park_client = TouringplansClient.new(routes: park_venue_routes)
    park_client.routes.keys.each do |key|
      puts key
      venue                   = Hash.new
      attraction              = park_client.send(key)
      permalink = park_venue_routes.fetch(key).fetch(:path, "").split("/").last
      attraction["permalink"] = permalink
      venues["attractions"]   << attraction
    end
    

    park            = TpParkRepresenter.new(name: venues["park_route"], attractions: [])
    # stuff the representation
    venues["attractions"].each {|i| park.represented[:attractions] << AttractionRepresentation.new(i)}


    park.represented[:attractions].each do |attraction|
      update_cached_touring_plans_venue_from_touringplans_com(representation: attraction)
    end
          # updated_venue = update_cached_touring_plans_venue_from_touringplans_com(
      #   route: park_route_key, 
      #   representation:  venue_representation)
      # puts updated_venue
  end
 
  def collect_touringplans_venue_representation(route:, permalink:)
    client.permalink          = permalink
    response                  = client.send(route)
    result                    = Representation.new(
        {"attractions" => [response]}
      )
  end
 
  def update_cached_touring_plans_venue_from_touringplans_com(representation:)
    puts "starting #{representation.permalink}"
    return venue_default if representation.permalink.to_s.length == 0

    tp_cached_venue  = TouringplansCachedVenue.find_or_create_by(permalink: representation.permalink)
    tp_cached_venue.update({name: representation.name,
      fastpass_booth: representation.fastpass_booth,
      short_name: representation.short_name,
      open_emh_morning: representation.open_emh_morning,
      open_emh_evening: representation.open_emh_evening,
      single_rider: representation.single_rider,
      time_zone: representation.time_zone,
      seasonal: representation.seasonal,
      open_very_merry: representation.open_very_merry,
      open_not_so_scary: representation.open_not_so_scary,
      category_code: representation.category_code,
      duration: representation.duration,
      scheduled_code: representation.scheduled_code,
      scope_and_scale_code: representation.scope_and_scale_code,
      when_to_go: representation.when_to_go,
      average_wait_per_hundred: representation.average_wait_per_hundred,
      average_wait_assumes: representation.average_wait_assumes,
      loading_speed: representation.loading_speed,
      probable_wait_time: representation.probable_wait_time,
      special_needs: representation.special_needs,
      height_restriction: representation.height_restriction,
      intense: representation.intense,
      extinct_on: representation.extinct_on,
      opened_on: representation.opened_on,
      frightening: representation.frightening,
      physical_considerations: representation.physical_considerations,
      handheld_captioning: representation.handheld_captioning,
      video_captioning: representation.video_captioning,
      reflective_captioning: representation.reflective_captioning,
      assistive_listening: representation.assistive_listening,
      audio_description: representation.audio_description,
      wheelchair_transfer_code: representation.wheelchair_transfer_code,
      no_service_animals: representation.no_service_animals,
      sign_language: representation.sign_language,
      service_animal_check: representation.service_animal_check,
      not_to_be_missed: representation.not_to_be_missed,
      rider_swap: representation.rider_swap,
      ultimate_code: representation.ultimate_code,
      ultimate_task: representation.ultimate_task,
      park_entrance: representation.park_entrance,
      relative_open: representation.relative_open,
      relative_close: representation.relative_close,
      close_at_dusk: representation.close_at_dusk,
      fastpass_available: representation.fastpass_available,
      crowd_calendar_version: representation.crowd_calendar_version,
      match_name: representation.match_name,
      crazy_threshold: representation.crazy_threshold,
      fastpass_only: representation.fastpass_only,
      allow_showtimes_after_close: representation.allow_showtimes_after_close,
      disconnected_fastpass_booth: representation.disconnected_fastpass_booth,
      crowd_calendar_group: representation.crowd_calendar_group,
      arrive_before: representation.arrive_before,
      arrive_before_fp: representation.arrive_before_fp,
      opens_at_sunset: representation.opens_at_sunset,
      closes_at_sunset: representation.closes_at_sunset,
      created_at: representation.created_at,
      updated_at: representation.updated_at,
      allow_time_restriction: representation.allow_time_restriction,
      relative_open_to_sunset: representation.relative_open_to_sunset,
      relative_close_to_sunset: representation.relative_close_to_sunset,
      closing_round_code: representation.closing_round_code,
      walking_time_proxy_id: representation.walking_time_proxy_id,
      flexible_duration: representation.flexible_duration,
      operator_id: representation.operator_id.to_i,
      operator_type: representation.operator_type,
      hide_app: representation.hide_app,
      showtime_proxy_id: representation.showtime_proxy_id.to_i
      })

    puts "==== #{tp_cached_venue.permalink} ==="
    # puts tp_cached_venue.attributes
    puts "======================="
    
    
  end

  # construct routes for each venue within a collection of attractions

  def generate_list_of_routes_of_attractions_in_a_park(park_route:)
    attraction_summary_hash = client.send(park_route)
    base_route = client.routes.fetch(park_route)[:path]
    new_routes_hash = Hash.new
    attraction_summary_hash.each do |i|
      attraction_route_key  = i["permalink"].parameterize.underscore.to_sym
      new_routes_hash[attraction_route_key] = {method: "get", path: [base_route, i["permalink"]].join("/")} 

    end
    result = new_routes_hash
  end
end