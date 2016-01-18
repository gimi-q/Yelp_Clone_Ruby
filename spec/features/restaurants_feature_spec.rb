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

  context 'creating restaurants' do
    scenario 'user fills out form, which displays new restaurant' do
      visit '/restaurants'
      click_link 'Add Restaurant'
      fill_in 'Name', with: 'Pizza Hut'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Pizza Hut'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing a restaurant' do

    let!(:kfc) {Restaurant.create(name: 'KFC')}

    scenario 'lets a user view a restaurant' do
     visit '/restaurants'
     click_link 'KFC'
     expect(page).to have_content 'KFC'
     expect(current_path).to eq "/restaurants/#{kfc.id}"
  end

  end
end
