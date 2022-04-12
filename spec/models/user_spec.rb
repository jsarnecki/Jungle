require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    xit "must be created with password and password_confirm" do
      @user = User.create(
        :first_name => "test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")

      expect(@user.password == @user.password_confirmation).to be_true

    end

    it "must be created with a unique email" do
      @user = User.new(
        :first_name => "test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")

      email_confirm = User.find_by_email(@user.email)

      expect(email_confirm).to be_nil
    end

    it "must include a first and last name" do
      @user = User.create(:first_name => "Josh", :last_name => "Man", :email => "test@test")
      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
    end

    it "must have a password with a minimum length of 5" do
      @user = User.create(
        :first_name => "Test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "1234",
        :password_confirmation => "1234")
      
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end

  end

  describe ".authenticate_with_credentials" do

  end
end
