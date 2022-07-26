require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "Should validate that the password and password_confirmation are filled out" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test@test.com", password: nil, password_confirmation: nil)
      expect(@user).to be_invalid
    end
    it "Should not create a new user if the password and password_confirmation do not match" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test@test.com", password: "tester2", password_confirmation: "blah")
      expect(@user).to be_invalid
    end
    it "Should verify the password is at least 6 characters long" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end
    it "Should validate that the email field is filled out" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: nil, password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end
    it "Should not create a new user if the email already exists in the database, regardless of case" do
      @user1 = User.create(first_name: "Jesse", last_name: "Kopala", email: "TEST@TEST.COM", password: "tester2", password_confirmation: "tester2")
      expect(@user1).to be_valid
      @user2 = User.create(first_name: "Jim", last_name: "Bob", email: "test@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user2).to be_invalid
    end
    it "Should validate that the first_name field was filled out" do
      @user = User.create(first_name: nil, last_name: "Kopala", email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end
    it "Should validate that the last_name field was filled out" do
      @user = User.create(first_name: "Jesse", last_name: nil, email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to be_invalid
    end
    it "Should create a new user if all fields are filled out, and the email has not been used" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test2@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "Should return an instance of the user object if the email and password are correct" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test2@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials(@user.email, "tester2")
      expect(auth).to eq(@user)
    end
    it "Should return nil if the email is not in the user database" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test2@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials(@user.email, "test")
      expect(auth).to eq(nil)
    end
    it "Should authenticate the user even if there are extra spaces in the email field" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test2@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials("  test2@test.com ", "tester2")
      expect(auth).to eq(@user)
    end
    it "Should authenticate the user even if the email case does not match" do
      @user = User.create(first_name: "Jesse", last_name: "Kopala", email: "test2@test.com", password: "tester2", password_confirmation: "tester2")
      expect(@user).to be_valid
      auth = User.authenticate_with_credentials("TEST2@test.com", "tester2")
      expect(auth).to eq(@user)
      auth2 = User.authenticate_with_credentials("tEst2@teSt.COM", "tester2")
      expect(auth2).to eq(@user)
      @user2 = User.create(first_name: "Jesse", last_name: "Kopala", email: "TEST@TEST.COM", password: "tester2", password_confirmation: "tester2")
      expect(@user2).to be_valid
      auth3 = User.authenticate_with_credentials("TEST@test.com", "tester2")
      expect(auth3).to eq(@user2)
      auth4 = User.authenticate_with_credentials("tEst@teSt.COM", "tester2")
      expect(auth4).to eq(@user2)
    end
  end

end
