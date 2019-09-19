class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    render partial: "reviews/reviews",
           locals: { restaurant: @restaurant, review: review },
           status: status
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def review
    @review.valid? ? Review.new : @review
  end

  def status
    @review.valid? ? :ok : :unprocessable_entity
  end
end
