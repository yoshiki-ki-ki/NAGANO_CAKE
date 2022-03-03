class Genre < ApplicationRecord
  ##アソシエーション　(genre)1:N(items)
  has_many :items, dependent: :destroy
end
