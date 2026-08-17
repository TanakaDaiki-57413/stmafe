class Category < ApplicationRecord
  # アソシエーション
  has_many :materials

  # バリデーション
  validates :name, presence: true
end
