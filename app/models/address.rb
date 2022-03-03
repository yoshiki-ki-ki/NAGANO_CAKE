class Address < ApplicationRecord
  ##アソシエーション (customer)1:N(addressse)
  belong_to :customer
end
