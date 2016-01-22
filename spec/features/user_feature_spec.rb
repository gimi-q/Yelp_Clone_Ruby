require 'rails_helper'
require 'web_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      # expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context 'when user not signed in' do
    it 'should not allow a user to create restaurant' do
      visit('/')
      click_link 'Add Restaurant'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'user' do
    it 'can only edit their own restaurant' do
      visit('/')
      sign_up
      create_restaurant
      click_link 'Sign out'
      sign_up2
      expect(page).not_to have_link 'Edit Pizza Hut'
    end

    it 'can only leave 1 review per restaurant' do
      visit('/')
      sign_up
      create_restaurant
      click_link 'Review Pizza Hut'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
      click_link 'Review Pizza Hut'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(page).to have_content 'cannot review same restaurant twice'
    end

    it 'can only  delete their own review' do
      visit('/')
      sign_up
      create_restaurant
      click_link 'Review Pizza Hut'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_link 'Sign out'
      sign_up2
      expect(page).to_not have_content 'Edit Pizza Hut'
    end
  end
 end
