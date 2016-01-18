require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants to see here'
      expect(page).to have_link 'Add Restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Pizza Hut')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'Pizza Hut'
      expect(page).not_to have_content 'No restaurants to see here'
    end
  end
end
