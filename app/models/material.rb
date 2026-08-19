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

  # レビュワーの平均学習時間を求める
  def calc_avg_studytime
    unless reviews.blank?
      total_time = 0
      reviews.each do |reviewer|
        total_time += reviewer.study_time
      end
      avg_study_time = total_time / reviews.count
      return avg_study_time
    else
      return 0
    end
  end

  # ransackで検索を許可するカラム名を指定
  def self.ransackable_attributes(auth_object = nil)
    %w[
    author
    average_rating
    body
    category_id
    isbn_number
    price
    publisher
    release_date
    study_level
    title
    ]
  end

  # ransackで検索を許可するアソシエーションを指定
  def self.ransackable_associations(auth_object = nil)
     %w[
    category
    material_tags
    tags
    ]
  end
end
