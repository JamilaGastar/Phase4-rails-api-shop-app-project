require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created successfully with valid data" do
    user = User.create(first_name: "Jamila", 
    username: "test_user", 
    password: "secretP9!", 
    phone_number: "0423181567", 
    email_address: "testemail@test.com", 
    location: "Test Suburb, 1234", 
    bio: "Bio", 
    image_url: "https://via.placeholder.com/150")
    expect(user).to be_valid
  end

  it "has many items" do
    expect(User.new).to respond_to(:items)
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(10) }

    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_uniqueness_of(:phone_number) }
    it { is_expected.to validate_length_of(:phone_number).is_equal_to(10) }

    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_uniqueness_of(:email_address) }
  
    it { is_expected.to validate_length_of(:bio).is_at_most(200) }
  end


  describe "authenticate" do
    it "returns the user if credentials match" do
        user = User.create(first_name: "Jamila", 
        username: "test_user", 
        password: "secretP9!", 
        phone_number: "0423181567", 
        email_address: "testemail@test.com", 
        location: "Test Suburb, 1234", 
        bio: "Bio", 
        image_url: "https://via.placeholder.com/150")
        expect(user.authenticate("secretP9!")).to eq(user)
    end
      
    it "returns false if credentials don't match" do
        user = User.create(first_name: "Jamila", 
      username: "test_user", 
      password: "secretP9!", 
      phone_number: "0423181567", 
      email_address: "testemail@test.com", 
      location: "Test Suburb, 1234", 
      bio: "Bio", 
      image_url: "https://via.placeholder.com/150")
        expect(user.authenticate("nope")).to be(false)
    end
  end
end
