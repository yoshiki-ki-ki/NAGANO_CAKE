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
    
  end
  
  def complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end
end
