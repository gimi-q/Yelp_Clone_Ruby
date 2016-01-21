class Restaurant < ActiveRecord::Base

  belongs_to :user

  has_many :reviews, dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true

  # def valid_edit
  #   if current_user.id == @restaurant.user_id
  #     @restaurant = Restaurant.find(params[:id])
  #   else
  #     flash[:notice] = "Can only edit restaurant you have created"
  #   end
  # end
end
