require 'rails_helper'

RSpec.describe "Items", type: :request do
  before do
    u1 = User.create!(first_name: "Jamila", 
    username: "test_user", 
    password: "secretP9!", 
    phone_number: "0423181567", 
    email_address: "testemail@test.com", 
    location: "Test Suburb, 1234", 
    bio: "Bio", 
    image_url: "https://via.placeholder.com/150")
    u1.items.create!(name: "Black Tigermist Strapless Dress", image_url: "https://via.placeholder.com/150", description: "Description", condition: "Used", price: 10)
  end

  
  describe "GET /items" do
    it 'returns an array of all items with user info' do
      get '/items'

      expect(response.body).to include_json([
        { 
          id: a_kind_of(Integer), 
          name: "Black Tigermist Strapless Dress", 
          image_url: "https://via.placeholder.com/150", 
          description: "Description", 
          condition: "Used", 
          price: 10,
          user: {
            id: a_kind_of(Integer),
            first_name: "Jamila", 
            username: "test_user", 
            password: "secretP9!", 
            phone_number: "0423181567", 
            email_address: "testemail@test.com", 
            location: "Test Suburb, 1234", 
            bio: "Bio", 
            image_url: "https://via.placeholder.com/150"
          }
        }
      ])
    end
  end
end
