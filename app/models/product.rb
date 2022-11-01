class Product < ApplicationRecord
  belongs_to :user
  validates :name, :brand, :price, :quantity, :material, presence: true
  has_many_attached :photos
end
