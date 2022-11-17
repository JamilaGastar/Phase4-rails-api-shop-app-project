class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :username, :location, :bio, :image_url
end
