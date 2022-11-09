class RemoveDescriptionFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :description, :text
  end
end
