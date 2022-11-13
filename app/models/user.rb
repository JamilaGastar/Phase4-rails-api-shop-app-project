class User < ApplicationRecord
    has_secure_password
    has_many :items

    validates :first_name, presence: true
    validates :username, { presence: true, uniqueness: true}
    validates :email_address, { presence: true, uniqueness: true}
    validates :phone_number, { presence: true, uniqueness: true, length: { is: 10 }}
    validates :password, length: { in: 6..10 }
    validates :bio, length: { maximum: 200 }
    
end
