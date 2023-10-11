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
		@booking = current_user.bookings.create(booking_params.merge(listing_id: @listing.id))

		if @booking.save
			redirect_to booking_path(@booking)
		else
			render :new
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
end