class ReviewsController < ApplicationController
  def new
    unless signed_in?
      flash[:error] = "You must be signed in to write a review."
      redirect_to new_user_session_path
    end
    @review = Review.new(params[:review])
  end
  
  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = "Your review has been saved."
      redirect_to api_path(:id => @review.api_id)
    else
      flash[:error] = "An error occured. Your review was not saved."
    end
  end
end