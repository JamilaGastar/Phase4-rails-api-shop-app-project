class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :username
      t.string :password_digest
      t.string :phone_number
      t.string :email_address
      t.string :location
      t.string :bio
      t.string :image_url

      t.timestamps
    end
  end
end
