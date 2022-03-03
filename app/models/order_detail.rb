class OrderDetail < ApplicationRecord
  ##アソシエーション　(item)1:N(order_details)
  belongs_to :item
  ##アソシエーション　(order)1:N(order_details)
  belongs_to :order
end
