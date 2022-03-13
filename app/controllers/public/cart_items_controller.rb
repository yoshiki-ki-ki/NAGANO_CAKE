class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    # 外部キーに値を入れなければデータの保存ができない
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_items_path, notice: "カートに追加されました"
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
