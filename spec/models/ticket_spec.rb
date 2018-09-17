require "rails_helper"

RSpec.describe Ticket, :type => :model do
  context "uniquenss of request number" do
    it "uniqueness of request number" do
      ticket1 = Ticket.create({:request_number => 1})
      ticket1.excavator = Excavator.create
      ticket1.save
      ticket2 = Ticket.create({:request_number => 1})
      expect(ticket2.errors.full_messages).to eq(["Request number has already been taken"])
    end
  end
end