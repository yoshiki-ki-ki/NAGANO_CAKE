class CartItem < ApplicationRecord
  ##アソシエーション　(customer)1:N(cart_items)
  belongs_to :customer
  ##アソシエーション　(item)1:N(cart_items)
  belongs_to :item
  
  ## 小計を求めるメソッド
  def subtotal
      item.with_tax_price * amount
  end
  
end
