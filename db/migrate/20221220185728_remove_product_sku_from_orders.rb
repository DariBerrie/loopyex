class RemoveProductSkuFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :product_sku
  end
end
