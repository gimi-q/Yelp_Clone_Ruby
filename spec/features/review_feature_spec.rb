require 'rails_helper'
require 'web_helper'

describe 'reviews' do
  before(:each) do
    visit '/restaurants'
    sign_up
    click_link 'Add Restaurant'
    fill_in 'Name', with: 'Pizza Hut'
    click_button 'Create Restaurant'
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review Pizza Hut'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'displays an average rating for all reviews' do

    leave_review('So so', '3')
    click_link 'Sign out'
    sign_up2
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
