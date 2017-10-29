class AttractionsController < ApplicationController
  def index
  end

  def show
  end
end
# 
class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show]

  # GET /venues
  def index
    @attractions = Attraction.all.limit(60)#.has_foursquare_eatery.order(thumbs_up: :desc).limit(60)
    venues_count_third      =  @attractions.count/3
    venues_count_two_thirds =  2*(@attractions.count/3)
    @first_third            = @attractions.first(venues_count_third)
    @second_third           = @attractions.limit(venues_count_third).offset(venues_count_third)
    @last_third             = @attractions.limit(venues_count_third).offset(venues_count_two_thirds)

  end

  # GET /venues/1
  def show
    # @attraction        = Attraction.find(params[:id])
    # @photos       = @venue.foursquare_eatery.find_cached_images
    # @tips         = @venue.foursquare_eatery.find_cached_tips
    # @dfb_articles = @venue.dfb_articles
    # @dfb_eatery   = @venue.dfb_eateries.first
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def venue_params
    #   params.require(:venue).permit(:name, :permalink, :category_code, :portion_size, :cost_code, :cuisine, :phone_number, :entree_range, :when_to_go, :parking, :bar, :wine_list, :dress, :awards, :breakfast_hours, :lunch_hours, :dinner_hours, :house_specialties, :counter_quality_rating, :counter_value_rating, :table_quality_rating, :table_value_rating, :overall_rating, :service_rating, :friendliness_rating, :thumbs_up, :adult_breakfast_menu_url, :adult_lunch_menu_url, :adult_dinner_menu_url, :child_breakfast_menu_url, :child_lunch_menu_url, :child_dinner_menu_url, :requires_credit_card, :requires_pre_payment, :extinct_on, :opened_on, :disney_permalink, :code, :short_name, :accepts_tiw, :accepts_reservations, :kosher_available, :location_details, :operator_id, :operator_url, :operator_type)
    # end
end
