require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "POST /signup" do
    context "with matching password confirmation" do
      let!(:user_params) do 
        { 
          first_name: "Jamila", 
          username: "test_user", 
          password: "secretP9!",
          password_confirmation: "secretP9!",
          phone_number: "0423181567", 
          email_address: "testemail@test.com", 
          location: "Test Suburb, 1234", 
          bio: "Bio", 
          image_url: "https://via.placeholder.com/150" 
        } 
      end
      
      it "creates a new user" do
        expect { post "/signup", params: user_params }.to change(User, :count).by(1)
      end

      it "saves the password as password_digest to allow authentication" do
        post "/signup", params: user_params

        expect(User.last.authenticate(user_params[:password])).to eq(User.last)
      end
      
      it "saves the user id in the session" do
        post "/signup", params: user_params

        expect(session[:user_id]).to eq(User.last.id)
      end
      
      it "returns the user as JSON" do
        post "/signup", params: user_params

        expect(response.body).to include_json({
          id: User.last.id,
          first_name: User.last.first_name,
          username: User.last.username,
          location: User.last.location,
          bio: User.last.bio,
          image_url: User.last.image_url
        })
      end

      it "returns a 201 (Created) HTTP status code" do
        post "/signup", params: user_params
        
        expect(response).to have_http_status(:created)
      end

    end

    context "with no matching password confirmation" do
      let!(:user_params) do 
        { 
          username: "test_user",
          password: "secretP9!",
          password_confirmation: "wrong",
          image_url: "https://via.placeholder.com/150", 
          bio: "Bio"
        } 
      end

      it "does not save the user" do
        expect { post "/signup" }.not_to change(User, :count)
      end

      it "returns a 422 (Unprocessable Entity) HTTP status code" do
        post "/signup", params: user_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
      
    end

    context "with invalid data" do
      let!(:user_params) do 
        { 
          password: "secretP9!",
          image_url: "https://via.placeholder.com/150", 
          bio: "Bio"
        } 
      end

      it "does not save the user" do
        expect { post "/signup" }.not_to change(User, :count)
      end

      it "returns a 422 unprocessable entity response" do
        post "/signup", params: user_params

        expect(response).to have_http_status(:unprocessable_entity)
      end


  # describe "GET /me" do
  #   let!(:user1) { User.create(first_name: "Second", username: "test_user_2", password: "secretP9!", location: "location, 1234", bio: "Bio", image_url: "https://via.placeholder.com/150") }
  #   let!(:user2) { User.create(first_name: "First", username: "test_user_1", password: "secretP9!", location: "location, 4321", bio: "Bio", image_url: "https://via.placeholder.com/150") }

    # it "returns the first user when the first user is logged in" do
    #   post "/login", params: { username: user1.username, password: user1.password }
    #   get "/me"

    #   expect(response.body).to include_json({
    #       id: user1.id,
    #       first_name: user1.first_name,
    #       username: user1.username,
    #       location: user1.location,
    #       bio: user1.bio,
    #       image_url: user1.image_url
    #   })
    # end
  # end

    # it "returns the second user when the second user is logged in" do
    #   post "/login", params: { username: user2.username, password: user2.password }
    #   get "/me"

    #   expect(response.body).to include_json({
    #     id: user2.id,
    #     first_name: user2.first_name,
    #     username: user2.username,
    #     location: user2.location,
    #     bio: user2.bio,
    #     image_url: user2.image_url
    #   })
    # end

    it "returns a 401 unauthorized response when no user is logged in" do
      get "/me"

      expect(response).to have_http_status(:unauthorized)
    end
 
      end
    end
end