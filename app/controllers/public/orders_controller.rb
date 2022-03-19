class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def order_confirmation
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @order.postage + @total_price
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
      # カート内にある商品情報は複数あるため、一個ずつ処理していく
      @cart_items.each do |cart_item|
        # まず最初に取り出した一つの商品に関するテーブルをorder_detailsに作成する
        order_detail = OrderDetail.new
        # order_detailsが持つカラムにデータを代入していく
        # 注文ID
        order_detail.order_id = @order.id
        # 商品ID
        order_detail.item_id = cart_item.item_id
        # 購入時価格（税込）
        order_detail.price = cart_item.item.price
        # 数量
        order_detail.amount = cart_item.amount
        # order_detailsにデータを保存
        order_detail.save
      end
    @cart_items.destroy_all
    redirect_to public_orders_complete_path
  end
  
  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.all
    @order.postage = 800
    @total_price = @order_detail.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @order.postage + @total_price
  end
  
  private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end
end
