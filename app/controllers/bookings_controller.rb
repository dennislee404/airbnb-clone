class BookingsController < ApplicationController
	before_action :authenticate_user!
	def index
		@bookings = current_user.bookings.all
	end

	def new
		@listing = Listing.find_by(id: params[:listing_id])
		@booking = Booking.new
	end

	def create
		@listing = Listing.find_by(id: params[:booking][:listing_id])

		if available_dates?(params[:booking][:check_in],params[:booking][:check_out],@listing)
			@booking = current_user.bookings.create(booking_params)
			@booking.listing_id = @listing.id
			if @booking.save
				redirect_to booking_path(@booking)
			else
				render :new
			end
		else
			redirect_to listing_path(@listing) 
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def edit
	end

	def update
	end

	private
		def booking_params
			params.require(:booking).permit(:check_in, :check_out)
		end

		def available_dates?(ci_date,co_date,listing)
			overlap_bookings = 
			listing.bookings.where(check_in: ci_date..co_date)
			.or(listing.bookings.where(check_out: ci_date..co_date))
			.or(listing.bookings.where("check_in <= ? AND check_out >= ?", ci_date, co_date))

			overlap_bookings.empty?
		end

end
