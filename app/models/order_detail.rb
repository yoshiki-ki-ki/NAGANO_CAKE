class OrderDetail < ApplicationRecord
  ##アソシエーション　(item)1:N(order_details)
  belongs_to :item
  ##アソシエーション　(order)1:N(order_details)
  belongs_to :order
  
  enum making_status: { cannot_be_manufactured: 0, awaiting_manufacture: 1, under_manufacture: 2, completion_of_production: 3 }
  
  ## 小計を求めるメソッド
  def subtotal
      item.with_tax_price * amount
  end
  
end
