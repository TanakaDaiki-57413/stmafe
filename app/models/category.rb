class Category < ApplicationRecord
  # アソシエーション
  has_many :materials
end
