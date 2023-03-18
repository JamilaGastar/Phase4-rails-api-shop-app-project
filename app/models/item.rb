class Item < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :description, length: { maximum: 200 }
    validates :condition, presence: true, inclusion: { in: ["New - with tags", "New - without tags", "Used - Excellent", "Used - Good", "Used"]}
    validates :price, presence: true
    validates :size, { presence: true, inclusion: {in: [6, 8, 10, 12, 14], message: "%{value} is not a valid size" } }
    validates :stock, { presence: true, numericality: { only_integer: true }}
end
