class Bookmark < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :material

  # バリデーション
  validates :user_id, uniqueness: { scope: :material_id }
end
