class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    # 外部キーに値を入れなければデータの保存ができない
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path(current_customer.id)
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path(current_customer.id)
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path(current_customer.id)
  end
  
  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end
