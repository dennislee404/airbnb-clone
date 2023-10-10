class ListingsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
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
		if @listing.update(listing_params)
			redirect_to listing_path(@listing)
		else
			render :edit 
		end
	end

	def destroy
		@listing.destroy

		redirect_to listings_path
	end

	private
		def set_listing
			@listing = Listing.find(params[:id])
		end

		def listing_params
			params.require(:listing).permit(:title, :description, :rooms, :capacity, :availability, :price, :location, :property_type)
		end
end