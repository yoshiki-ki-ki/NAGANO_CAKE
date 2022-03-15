class OrderDetail < ApplicationRecord
  ##アソシエーション　(item)1:N(order_details)
  belongs_to :item
  ##アソシエーション　(order)1:N(order_details)
  belongs_to :order
  
  enum making_status: { credit_card: 0, transfer: 1 }
  
end
