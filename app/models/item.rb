class Item < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :condition, presence: true
    validates :price, presence: true
    validates :size, presence: true
    validates :stock, presence: true
end
