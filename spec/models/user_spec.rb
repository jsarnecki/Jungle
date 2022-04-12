require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "must be created with password and password_confirm" do
      @user = User.create(
        :first_name => "test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")

      expect(@user.valid?).to be_truthy

    end

    it "returns invalid when password and confirmation does not match" do
      @user = User.create(
        :first_name => "test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "")

      expect(@user.valid?).to be_falsey

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
      @user = User.create(
        :first_name => "Test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")
      
      expect(@user.valid?).to be_truthy
    end

    it "will return invalid if missing a first or last name" do
      @user = User.create(
        :first_name => "Test", 
        :last_name => nil, 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")
      
      expect(@user.valid?).to be_falsey
    end

    it "must have a error message when password length is less than 5" do
      @user = User.create(
        :first_name => "Test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "1234",
        :password_confirmation => "1234")
      
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end

    it "must have a password with minimum length of 5" do
      @user = User.create(
        :first_name => "Test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")
      
        expect(@user.valid?).to be_truthy 
    end

  end

  describe ".authenticate_with_credentials" do
    
    before do
      @user = User.create(
        :first_name => "Test", 
        :last_name => "123", 
        :email => "test@123", 
        :password => "12345",
        :password_confirmation => "12345")
    end
    
    it "should still login users if there is white space around their email" do
      email = "   test@123  "
      expect(@user.authenticate_with_credentials(email, "12345")).to be_truthy
    end

    it "should still login users if their email spelling is correct, but case is wrong" do
      email = "Test@123"
      expect(@user.authenticate_with_credentials(email, "12345")).to be_truthy

    end

  end
end
