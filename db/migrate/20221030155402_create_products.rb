class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.integer :quantity
      t.string :weight
      t.string :size
      t.string :material
      t.string :color
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
