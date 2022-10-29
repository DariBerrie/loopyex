class CreateYarns < ActiveRecord::Migration[7.0]
  def change
    create_table :yarns do |t|
      t.string :name
      t.string :colour
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
