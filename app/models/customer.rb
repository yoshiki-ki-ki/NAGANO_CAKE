class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  ##アソシエーション　(customer)1:N(addressse,cart_items,orders)
  has_many :addresses, depnendent: :destroy
  has_many :cart_items, depnendent: :destroy
  has_many :orders, depnendent: :destroy
end
