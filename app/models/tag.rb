class Tag < ApplicationRecord
  # アソシエーション
  has_many :material_tags
  has_many :materials, through: :material_tags

  # バリデーション
  validates :name, presence: true
end
