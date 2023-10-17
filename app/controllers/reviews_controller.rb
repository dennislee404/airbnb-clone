class ReviewsController < ApplicationController
	def create
		@listing = Listing.find_by(id: params[:review][:listing_id])
		@review = current_user.reviews.create(
			comment: params[:review][:comment],
			rating: params[:review][:rating],
			reviewable_type: @listing.class,
			reviewable_id: @listing.id)

		if @review.save
			render turbo_stream: turbo_stream.append('review_form', partial:'review_details', locals:{review: @review})
			# redirect_to listing_path(@listing)
		else
			redirect_to listing_path(@listing)
			# render :new 
		end
	end

	# def review_params
	# 	params.require(:review).permit(:comment, :rating, :reviewable_type, :reviewable_id)
	# end
end

