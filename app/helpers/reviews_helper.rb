module ReviewsHelper
  def star_rating(rating)
    rating != 'N/A' ?  '★' * rating.round + ('☆' * (5-rating) ) : rating
  end

end
