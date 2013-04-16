class ReviewsController < ApplicationController
  def new
    @review = Review.new(params[:review])
  end
  
  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = "Your review has been saved"
      redirect_to root_path
    end
  end
end