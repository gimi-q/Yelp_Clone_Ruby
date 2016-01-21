class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build_with_user(review_params(params[:restaurant_id]), current_user)

    if @review.save
    redirect_to restaurants_path
  else
    flash[:notice] = "cannot review same restaurant twice"
      if @review.errors[:user]
        redirect_to restaurants_path, alert: 'cannot review same restaurant twice'
      else
        render :new
      end
    end
  end

  def review_params(restaurant_id)
    params.require(:review).permit(:thoughts, :rating, restaurant_id)
  end

end
