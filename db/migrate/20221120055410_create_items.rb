class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :condition
      t.integer :size
      t.decimal :price
      t.integer :stock
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
