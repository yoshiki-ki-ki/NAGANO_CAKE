class OrderDetail < ApplicationRecord
  ##アソシエーション　(item)1:N(order_details)
  belong_to :item
  ##アソシエーション　(order)1:N(order_details)
  belong_to :order
end
