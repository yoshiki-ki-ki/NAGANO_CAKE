class Order < ApplicationRecord
  ##アソシエーション　(customer)1:N(orders)
  belongs_to :customer
  ##アソシエーション　(order)1:N(order_details)
  has_many :order_details, dependent: :destroy
end
