class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :property_type
      t.integer :rooms, default: 0
      t.integer :capacity, default: 0
      t.boolean :availability, default: false
      t.string :location
      t.decimal :price, precision: 10, scale: 2
      t.decimal :avg_rating, precision: 5, scale: 2

      t.timestamps
    end
  end
end
