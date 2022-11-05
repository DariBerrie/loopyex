class AddAddressToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :address, :string
  end
end
