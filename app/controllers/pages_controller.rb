class PagesController < ApplicationController
	def index
		# if params[:location].blank?
		# 	@listings = Listing.all
		# else
		# 	@listings = Listing.where(location: params[:location])
		# end

		if params[:check_in].blank? or params[:check_out].blank?
			@listings = Listing.all 
		else
			@unavailable_listings = Booking.where(check_in: params[:check_in]..params[:check_out])
			.or(Booking.where(check_out: params[:check_in]..params[:check_out])).pluck(:listing_id)
			@listings = Listing.where.not(id: @unavailable_listings)
		end
	end
end