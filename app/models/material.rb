class Material < ApplicationRecord
  # アソシエーション
  has_many :reviews, dependent: :destroy
  has_many :material_tags
  has_many :tags, through: :material_tags

  belongs_to :category

  # 表紙画像を教材レコードに添付
  has_one_attached :cover_image

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :publisher, presence: true
  validates :price, presence: true,  numericality: { only_integer: true }
  validates :release_date, presence: true
  validates :isbn_number, presence: true, uniqueness: true


  # 画像表示処理
  def get_cover_image(width, height)
    unless cover_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      cover_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    cover_image.variant(resize_to_fill: [ width, height ]).processed
  end
end
