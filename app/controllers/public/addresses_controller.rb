class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to public_addresses_path(current_customer.id)
  end

  def edit
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
end
