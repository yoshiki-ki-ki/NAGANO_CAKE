class CartItem < ApplicationRecord
  ##アソシエーション　(customer)1:N(cart_items)
  belongs_to :customer
  ##アソシエーション　(item)1:N(cart_items)
  belongs_to :item
end
