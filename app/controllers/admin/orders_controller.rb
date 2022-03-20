class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.all
    @order.postage = 800
    @total_price = @order_detail.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @order.postage + @total_price
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end
end
