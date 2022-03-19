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
    redirect_to public_orders_complete_path
  end
  
  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @order.postage + @total_price
    @order_detail = @order.prder_details.all
  end
  
  private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end
end
