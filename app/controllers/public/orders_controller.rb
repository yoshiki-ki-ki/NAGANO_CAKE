class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def order_confirmation
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
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
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :order_status)
  end
end
