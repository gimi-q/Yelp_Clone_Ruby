def sign_up
  click_link("Sign up")
   fill_in("Email", with: "test@test.com")
   fill_in("Password", with: "testtest")
   fill_in("Password confirmation", with: "testtest")
   click_button("Sign up")
end

def sign_up2
  click_link("Sign up")
   fill_in("Email", with: "newtest@test.com")
   fill_in("Password", with: "test1234")
   fill_in("Password confirmation", with: "test1234")
   click_button("Sign up")
end

def create_restaurant
  click_link 'Add Restaurant'
  fill_in 'Name', with: 'Pizza Hut'
  click_button 'Create Restaurant'
end
