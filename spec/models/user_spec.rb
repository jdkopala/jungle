require 'rails_helper'

RSpec.describe User, type: :model do
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
  it "Should not create a new user if the email already exists in the database" do
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
