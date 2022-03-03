class Address < ApplicationRecord
  ##アソシエーション (customer)1:N(addressse)
  belongs_to :customer
end
