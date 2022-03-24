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
    if @order.update(order_params)
      # 注文ステータスが入金確認の時、すべての商品の製作ステータスを製作中に更新する
      @order.order_details.update_all(making_status:'awaiting_manufacture') if @order.order_status == 'payment_confirmation'
    end
    redirect_to admin_order_path(@order.id)
  end

  def production_update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.find_by(making_status:'under_manufacture').present?
      @order.update(order_status:'under_manufacture')
    end
    if @order_details.where(making_status:'completion_of_production').count == @order_details.count
      @order.update(order_status:'preparing_to_ship')
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :postage, :order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
