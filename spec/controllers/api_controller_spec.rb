require "rails_helper"

RSpec.describe ApiController do

	describe "GET index" do

		it "should have tickets" do
			post :create_ticket,params: {"request_number" => "10000"},:format => 'json'
			expect(response.status).to eq(200)
		end
	end

end