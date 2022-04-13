require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!(
      :first_name => "test", 
      :last_name => "123", 
      :email => "test@123", 
      :password => "12345",
      :password_confirmation => "12345")
  end

scenario "They can successfully login and are taken to the home page" do

  visit "/login"

  #find the login form
  # page.find('.navbar-right').find_link('Login').click
  #fill_in the form with above credentials, click login
  expect(page).to have_text 'Login'
  # puts page.html
  fill_in "email", with: "test@123"
  fill_in "password", with: "12345"

  #verify on home page and there is logout button present

  # save_screenshot

end

end