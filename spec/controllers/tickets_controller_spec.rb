require "rails_helper"

RSpec.describe TicketsController do

	describe "GET index" do

		it "should have tickets" do
			ticket = FactoryBot.create(:ticket)
			get :index
			expect(assigns[:tickets].klass).to eq(Ticket)
		end

		it "renders the index template" do
			get :index
			expect(response.status).to eq(200)
		end
	end

	describe "GET show" do
			let(:id) { 2 }
		it "should have party by id" do
			ticket = FactoryBot.create(:ticket)
			get :show,params: { id: ticket.id }
			expect(assigns[:ticket].class).to eq(Ticket)
			expect(assigns[:ticket].id).to eq(ticket.id)
		end

		it "renders the index template" do
			ticket = FactoryBot.create(:ticket)
			get :show,params: {id: ticket.id}
			expect(response.status).to eq(200)
		end
	end

end