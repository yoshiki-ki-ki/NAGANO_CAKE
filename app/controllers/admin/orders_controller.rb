class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.orde
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end
end
