class Review < ActiveRecord::Base

  belongs_to :restaurant

  belongs_to :user

  validates :rating, inclusion: (1..5)

  validates :user, uniqueness: { scope: :restaurant, message: "cannot review same restaurant twice"}

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end
end
