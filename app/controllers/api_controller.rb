class ApiController < ActionController::API
	def create_ticket
		@ticket = Ticket.new
		@ticket.request_number = params["RequestNumber"]
		@ticket.sequence_number = params["SequenceNumber"]
		@ticket.request_type = params["RequestType"]
		@ticket.response_due_date_time = params["DateTimes"]["ResponseDueDateTime"] rescue nil
		@ticket.primary_service_area_code = params["ServiceArea"]["PrimaryServiceAreaCode"]["SACode"] rescue nil
		@ticket.additional_service_area_codes = params["ServiceArea"]["AdditionalServiceAreaCodes"]["SACode"] rescue nil
		@ticket.digsite_info = params["ExcavationInfo"]["DigsiteInfo"]["WellKnownText"]rescue nil
		@ticket.excavator = Excavator.new
		@ticket.excavator.company_name = params["Excavator"]["CompanyName"] rescue nil
		@ticket.excavator.address = [params["Excavator"]["Address"] ,params["Excavator"]["City"],params["Excavator"]["State"],params["Excavator"]["Zip"]].join(" ") rescue nil
		@ticket.excavator.crew_on_site = (params["Excavator"]["CrewOnsite"] == "true" ? true : false ) rescue false
		if @ticket.save
			render :json => @ticket
		else
			render :json => @ticket.errors.full_messages
		end
	end
end
