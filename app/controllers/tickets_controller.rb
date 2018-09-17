class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    if @ticket.digsite_info.present?
      factory = RGeo::GeoJSON::EntityFactory.instance
      @hash = RGeo::GeoJSON.encode(factory.feature(RGeo::Geographic.spherical_factory.parse_wkt(@ticket.digsite_info)))
      File.open("public/polygon_#{@ticket.id}.json", 'w') {|file| file.write @hash.to_json}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.fetch(:ticket, {})
    end
end
