class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  monetize :amount_cents
end
