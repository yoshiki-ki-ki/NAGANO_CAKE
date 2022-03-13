class Item < ApplicationRecord
  has_one_attached :image
  
  ##アソシエーション　(item)1:N(cart_items,order_details)
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  ##アソシエーション　(genre)1:N(items)
  belongs_to :genre
  
    # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
end
