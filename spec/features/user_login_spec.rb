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

  visit root_path

  #find the login form
  #fill_in the form with above credentials, click login
  #verify on home page and there is logout button present

  save_screenshot

end

end