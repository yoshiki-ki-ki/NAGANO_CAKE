class CartItem < ApplicationRecord
  ##アソシエーション　(customer)1:N(cart_items)
  belong_to :customer
  ##アソシエーション　(item)1:N(cart_items)
  belong_to :item
end
