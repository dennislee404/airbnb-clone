class ListingsController < ApplicationController
	def index
		@listings = current_user.listings.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.create(listing_params)

		if @listing.save
			redirect_to listing_path(@listing)
		else 
			render :new 
		end		
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def listing_param
			# params.require(:listing).permit(:)
		end
end