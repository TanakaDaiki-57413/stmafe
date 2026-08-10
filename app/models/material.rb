class Material < ApplicationRecord
  # アソシエーション
  has_many :reviews dependent: :destroy
  has_many :material_tags
  has_many :tags, through: :material_tags

  belongs_to :category

  # 表紙画像を教材レコードに添付
  has_one_attached :cover_image
end
