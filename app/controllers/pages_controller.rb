class PagesController < ApplicationController
	def index
		@check_in = params[:check_in]
		@check_out = params[:check_out]

		if @check_in.blank? and @check_out.blank? and params[:location].blank?
			@listings = Listing.all 
		else
			if params[:location].present?
				@listings = Listing.where(location: params[:location])
			else
				@listings = Listing.all
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


