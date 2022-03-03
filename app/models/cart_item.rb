class CartItem < ApplicationRecord
  ##アソシエーション　(customer)1:N(cart_items)
  belong_to :customer
end
