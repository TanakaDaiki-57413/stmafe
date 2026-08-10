class MaterialTag < ApplicationRecord
  # アソシエーション
  belongs_to :material
  belongs_to :tag
end
