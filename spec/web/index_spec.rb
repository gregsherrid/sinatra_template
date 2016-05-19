require "./spec/spec_helper.rb"

describe "Homepage" do
	include Rack::Test::Methods

	before { get "/" }

	it "| Has service name" do
		rsp = last_response
		rsp.should be_ok
		rsp.body.include?("Greg's Sinatra Template App").should == true
	end
end
