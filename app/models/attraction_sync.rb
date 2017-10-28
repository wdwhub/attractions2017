class AttractionSync
  attr_reader :permalinks
  def initialize( permalinks: TouringplansCachedVenue.all.collect {|venue| venue.permalink})
    @permalinks = permalinks
  end

  def title
    "attraction sync"
  end


  def update_all_from_touringplans_com
    permalinks.each do |permalink|
      update_from_touringplans_com(permalink: permalink)
    end
  end

  def update_from_touringplans_com(permalink:)
    return if permalink.to_s.length == 0
    tvc = TouringplansCachedVenue.find_by(permalink: permalink)
    cached_attraction  = Attraction.find_or_create_by(permalink: tvc.permalink)


      cached_attraction.update({name: tvc.name,
      fastpass_booth: tvc.fastpass_booth,
      short_name: tvc.short_name,
      open_emh_morning: tvc.open_emh_morning,
      open_emh_evening: tvc.open_emh_evening,
      single_rider: tvc.single_rider,
      time_zone: tvc.time_zone,
      seasonal: tvc.seasonal,
      open_very_merry: tvc.open_very_merry,
      open_not_so_scary: tvc.open_not_so_scary,
      category_code: tvc.category_code,
      duration: tvc.duration,
      scheduled_code: tvc.scheduled_code,
      scope_and_scale_code: tvc.scope_and_scale_code,
      when_to_go: tvc.when_to_go,
      average_wait_per_hundred: tvc.average_wait_per_hundred,
      average_wait_assumes: tvc.average_wait_assumes,
      loading_speed: tvc.loading_speed,
      probable_wait_time: tvc.probable_wait_time,
      special_needs: tvc.special_needs,
      height_restriction: tvc.height_restriction,
      intense: tvc.intense,
      extinct_on: tvc.extinct_on,
      opened_on: tvc.opened_on,
      frightening: tvc.frightening,
      physical_considerations: tvc.physical_considerations,
      handheld_captioning: tvc.handheld_captioning,
      video_captioning: tvc.video_captioning,
      reflective_captioning: tvc.reflective_captioning,
      assistive_listening: tvc.assistive_listening,
      audio_description: tvc.audio_description,
      wheelchair_transfer_code: tvc.wheelchair_transfer_code,
      no_service_animals: tvc.no_service_animals,
      sign_language: tvc.sign_language,
      service_animal_check: tvc.service_animal_check,
      not_to_be_missed: tvc.not_to_be_missed,
      rider_swap: tvc.rider_swap,
      ultimate_code: tvc.ultimate_code,
      ultimate_task: tvc.ultimate_task,
      park_entrance: tvc.park_entrance,
      relative_open: tvc.relative_open,
      relative_close: tvc.relative_close,
      close_at_dusk: tvc.close_at_dusk,
      fastpass_available: tvc.fastpass_available,
      crowd_calendar_version: tvc.crowd_calendar_version,
      match_name: tvc.match_name,
      crazy_threshold: tvc.crazy_threshold,
      fastpass_only: tvc.fastpass_only,
      allow_showtimes_after_close: tvc.allow_showtimes_after_close,
      disconnected_fastpass_booth: tvc.disconnected_fastpass_booth,
      crowd_calendar_group: tvc.crowd_calendar_group,
      arrive_before: tvc.arrive_before,
      arrive_before_fp: tvc.arrive_before_fp,
      opens_at_sunset: tvc.opens_at_sunset,
      closes_at_sunset: tvc.closes_at_sunset,
      created_at: tvc.created_at,
      updated_at: tvc.updated_at,
      allow_time_restriction: tvc.allow_time_restriction,
      relative_open_to_sunset: tvc.relative_open_to_sunset,
      relative_close_to_sunset: tvc.relative_close_to_sunset,
      closing_round_code: tvc.closing_round_code,
      walking_time_proxy_id: tvc.walking_time_proxy_id,
      flexible_duration: tvc.flexible_duration,
      operator_id: tvc.operator_id.to_i,
      operator_type: tvc.operator_type,
      hide_app: tvc.hide_app,
      showtime_proxy_id: tvc.showtime_proxy_id.to_i
      }

        )

      puts "==== #{cached_attraction.permalink} ==="
      puts cached_attraction.attributes
      puts "======================="

  end
end
