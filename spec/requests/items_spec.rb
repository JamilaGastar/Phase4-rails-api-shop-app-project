require "rails_helper"

RSpec.describe "Items", type: :request do
  let!(:user) { User.create(first_name: "firstname", username: "test_user", password: "sup3r-secret", location: "location", bio: "bio", image_url: "https://via.placeholder.com/150") }
  
  describe "GET /items" do

    before do 
      Item.create([
        {
          user_id: user.id,
          name: "Black Tigermist Strapless Dress", 
          image_url: "",
          description: "Tigermist brand, only worn once, still in good condition.",
          condition: "Used - Excellent",
          price: "10",
          stock: 1,
          size: 8
        },
        {
          user_id: user.id,
          name: "Black Mini Skirt", 
          image_url: "",
          description: "Mini Skirt with side slit, low waist fit. Never been worn so is still in great condition with tags",
          condition: "New - with tags",
          price: "15",
          stock: 1,
          size: 8
        }
      ])
    end

    context "with a logged in user" do
      before do
        post "/login", params: { username: user.username, password: user.password }
      end
      
      it "returns an array of items with their associated users" do
        get "/items"

        expect(response.body).to include_json([[
          {
          id: a_kind_of(Integer),
          name: "Black Tigermist Strapless Dress", 
          image_url: "",
          description: "Tigermist brand, only worn once, still in good condition.",
          condition: "Used - Excellent",
          price: "10",
          stock: 1,
          size: 8,
            user: {
              id: user.id,
              first_name: user.first_name,
              username: user.username,
              location: user.location,
              bio: user.bio,
              image_url: user.image_url
            }
          },
          {
            id: a_kind_of(Integer),
            name: "Black Mini Skirt", 
            image_url: "",
            description: "Mini Skirt with side slit, low waist fit. Never been worn so is still in great condition with tags",
            condition: "New - with tags",
            price: "15",
            stock: 1,
            size: 8,
            user: {
              id: user.id,
              first_name: user.first_name,
              username: user.username,
              location: user.location,
              bio: user.bio,
              image_url: user.image_url
            }
          }
        ]])
      end
    end

    context "with no logged in user" do

      it "returns an array of error messages in the body" do
        get "/items"

        expect(response.body).to include_json({
          errors: a_kind_of(Array)
        })
      end

      it "returns a 401 (Unauthorized) HTTP status code" do
        get "/items"

        expect(response).to have_http_status(:unauthorized)
      end
      
    end
  end

  describe "POST /items" do

    context "with a logged in user and valid data" do
      let!(:item_params) do 
        { 
          name: "Black Mini Skirt", 
          image_url: "",
          description: "Mini Skirt with side slit, low waist fit. Never been worn so is still in great condition with tags",
          condition: "New - with tags",
          price: "15",
          stock: 1,
          size: 8
        }
      end 

      before do
        post "/login", params: { username: user.username, password: user.password }
      end

      it "creates a new item in the database" do
        expect { post "/items", params: item_params }.to change(Item, :count).by(1)
      end

      it "returns the new item along with its associated user" do
        post "/items", params: item_params

        expect(response.body).to include_json({
          id: a_kind_of(Integer),
          name: "Black Tigermist Strapless Dress", 
          image_url: "",
          description: "Tigermist brand, only worn once, still in good condition.",
          condition: "Used - Excellent",
          price: "10",
          stock: 1,
          size: 8,
          user: {
            first_name: user.first_name,
            username: user.username,
            location: user.location,
            bio: user.bio,
            image_url: user.image_url
          }
        })
      end

      it "returns a 201 (Created) HTTP status code" do
        post "/items", params: item_params

        expect(response).to have_http_status(:created)
      end
      
    end

    context "with a logged in user and invalid data" do
      let!(:item_params) do 
        { 
          name: "Black Tigermist Strapless Dress", 
          image_url: "",
          description: "Tigermist brand, only worn once, still in good condition.",
        }
      end 

      before do
        post "/login", params: { username: user.username, password: user.password }
      end

      it "does not create a new recipe in the database" do
        expect { post "/items", params: item_params }.not_to change(Item, :count)
      end

      it "returns an array of validation error messsages" do
        post "/items", params: item_params

        expect(response.body).to include_json({
          errors: a_kind_of(Array)
        })
      end

      it "returns a 422 (Unprocessable Entity) HTTP status code" do
        post "/items", params: item_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
      
    end

    context "with no logged in user" do

      it "returns an array of error messages in the body" do
        post "/items"

        expect(response.body).to include_json({
          errors: a_kind_of(Array)
        })
      end

      it "returns a 401 (Unauthorized) HTTP status code" do
        post "/items"

        expect(response).to have_http_status(:unauthorized)
      end
      
    end

  end
  
end
