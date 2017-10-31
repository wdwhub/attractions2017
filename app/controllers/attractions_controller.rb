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
    @photos       = @attraction.foursquare_review.cached_photos
    # @tips         = @venue.foursquare_review.find_cached_tips
    # @dfb_articles = @venue.dfb_articles
    # @dfb_eatery   = @venue.dfb_eateries.first
  end

  def new
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

end
