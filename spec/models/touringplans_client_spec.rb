require 'rails_helper'

RSpec.describe TouringplansClient, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#routes" do
    	it "works" do
    		expect(subject.routes).to eq("somethins") 
    	end

    	it "returns a Hash" do
    		expect(subject.routes).to be_a(Hash) 
    	end

    	it "returns a symbol for the first key" do
    		expect(subject.routes.keys.first).to  be_a(Symbol)
    	end

    	it "returns a hash for the first value" do
    		expect(subject.routes.values.first).to  be_a(Hash) 
    	end
    end  

    # note that these methods below are dynamic and result from routes
    describe "#magic_kingdom" do

		let(:magic_kingdom_query) { File.read( Rails.root + 'spec/support/shared_examples/magic_kingdom_attractions.json' ) }

    	before do
    	stub_request(:get, "https://touringplans.com/magic-kingdom/attractions.json").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'MyLib v1.2'}).
         to_return(status: 200, body: magic_kingdom_query, headers: {})
    	end

	    # it 'works' do
	    #   expect(subject.magic_kingdom).to eq("something")
	    # end

	    it 'returns an array of hashes' do
	      target = subject.magic_kingdom
	      parsed_response = JSON.parse(target)
	      expect(parsed_response).to be_a_kind_of(Array)
	    end
	    
	    it 'returns between 1 and 30 venues' do
	      target = subject.magic_kingdom
	      parsed_response = JSON.parse(target)
	    	expect(parsed_response.length).to  be_within(61).of(70)
	    end
	end

    describe "#epcot" do

		let(:epcot_query) { File.read( Rails.root + 'spec/support/shared_examples/epcot_attractions.json' ) }

    	before do
    	stub_request(:get, "https://touringplans.com/epcot/attractions.json").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'MyLib v1.2'}).
         to_return(status: 200, body: epcot_query, headers: {})
    	end

	    # it 'works' do
	    #   expect(subject.epcot).to eq("something")
	    # end

	    it 'returns an array of hashes' do
	      target = subject.epcot
	      parsed_response = JSON.parse(target)
	      expect(parsed_response).to be_a_kind_of(Array)
	    end
	    
	    it 'returns between 1 and 30 venues' do
	      target = subject.epcot
	      parsed_response = JSON.parse(target)
	    	expect(parsed_response.length).to  be_within(6).of(30)
	    end
	end

end
