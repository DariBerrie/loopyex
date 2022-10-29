class AddColumnsToYarn < ActiveRecord::Migration[7.0]
  def change
    add_column :yarns, :material, :string
    add_column :yarns, :brand, :string
    add_column :yarns, :weight, :string
  end
end
