class Address < ApplicationRecord
  ##アソシエーション (customer)1:N(addressse)
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
