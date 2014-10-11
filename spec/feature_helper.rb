require_relative 'spec_helper'

def login_as user
  visit '/login'
  expect(page).to have_content 'Username'
  expect(page).to have_content 'Password'

  fill_in 'Username', :with => user.username
  fill_in 'Password', :with => user.password
  click_button 'Log in'
end
