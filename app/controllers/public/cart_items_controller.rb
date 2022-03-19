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
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path(current_customer.id)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path(current_customer.id)
  end
  
  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path(current_customer.id)
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
