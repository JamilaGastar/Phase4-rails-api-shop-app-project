class AddUserToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :user
  end
end
