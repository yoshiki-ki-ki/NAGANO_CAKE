class Order < ApplicationRecord
  ##アソシエーション　(customer)1:N(orders)
  belong_to :customer
end
