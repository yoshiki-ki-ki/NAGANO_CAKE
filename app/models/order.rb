class Order < ApplicationRecord
  ##アソシエーション　(customer)1:N(orders)
  belongs_to :customer
  ##アソシエーション　(order)1:N(order_details)
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { awaiting_payment: 0, payment_confirmation: 1, under_manufacture: 2, preparing_to_ship: 3, already_shipped: 4 }
end
