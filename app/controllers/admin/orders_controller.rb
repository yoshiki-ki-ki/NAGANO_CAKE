class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.all
    @order.postage = 800
    @total_price = @order_detail.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @order.postage + @total_price
  end

  def orders_update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  def production_update
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
