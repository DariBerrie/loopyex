class ChangePriceToPriceCentsInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :price, :price_cents
  end
end
