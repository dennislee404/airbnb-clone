class PagesController < ApplicationController
	def index
		@check_in = params[:check_in]
		@check_out = params[:check_out]
		@listings = Listing.where(availability: true) 

		if @check_in.blank? and @check_out.blank? and params[:location].blank?
			@listings = @listings
		else
			if params[:location].present?
				@listings = @listings.where(location: params[:location])
			else
				@listings = @listings
			end

			if params[:check_in].present? and params[:check_out].present?
				@unavailable_listings = Booking.where(check_in: @check_in..@check_out)
				.or(Booking.where(check_out: @check_in..@check_out))
				.or(Booking.where("check_in <= ? AND check_out >= ?", @check_in, @check_out))
				.pluck(:listing_id)

				@listings = @listings.where.not(id: @unavailable_listings)
			end
		end
	end
end


