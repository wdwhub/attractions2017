require 'rails_helper'

RSpec.describe TouringplansSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("I am the awesome touring plans park sync")
    end
  end

 #  describe "#update_park_venues" do
	# let(:magic_kingdom_query) { File.read( Rails.root + 'spec/support/shared_examples/magic_kingdom_attractions.json' ) }

	# before do
	# 		stub_request(:get, "https://touringplans.com/magic-kingdom/attractions.json").
	#      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'MyLib v1.2'}).
	#      to_return(status: 200, body: magic_kingdom_query, headers: {})
	# end


 #  	it "works" do
 #  		expect(subject.update_park_venues(park_route_key: :magic_kingdom)).to  eq("something")
 #  	end
 #  end

 #  describe "#generate_list_of_routes_of_attractions_in_a_park" do
	# let(:magic_kingdom_query) { File.read( Rails.root + 'spec/support/shared_examples/magic_kingdom_attractions.json' ) }

	# before do
	# 		stub_request(:get, "https://touringplans.com/magic-kingdom/attractions.json").
	#      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'MyLib v1.2'}).
	#      to_return(status: 200, body: magic_kingdom_query, headers: {})
	# end
 #  	it "works" do
 #  		expect(TouringplansSync.new.generate_list_of_routes_of_attractions_in_a_park(park_route: :magic_kingdom)).to  
 #  			eq("something")
 #  	end
 #  end
end
