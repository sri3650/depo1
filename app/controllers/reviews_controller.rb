class ReviewsController < ApplicationController
	
  def create
  	
    @review = Review.create(:product_id=>params[:review][:product_id],:rating=> params[:review][:rating], :user_id => current_user)
    redirect_to store_url
  end
end