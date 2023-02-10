class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :condition, :price, :stock
end
