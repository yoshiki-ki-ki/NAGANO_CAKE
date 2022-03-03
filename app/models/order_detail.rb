class OrderDetail < ApplicationRecord
  ##アソシエーション　(item)1:N(order_details)
  belong_to :item
end
