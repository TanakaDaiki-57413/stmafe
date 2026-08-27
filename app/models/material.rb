class Material < ApplicationRecord
  # アソシエーション
  has_many :reviews, dependent: :destroy
  has_many :material_tags, dependent: :destroy
  has_many :tags, through: :material_tags
  has_many :bookmarks

  belongs_to :category

  # 表紙画像を教材レコードに添付
  has_one_attached :cover_image

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :publisher, presence: true
  validates :price, presence: true,  numericality: { only_integer: true }
  validates :release_date, presence: true
  validates :isbn_number, presence: true, uniqueness: true, length: { is: 13 }

  # 発売日のバリデーション(未来の日付を入力させない)
  validate :day_after_today
  def day_after_today
    unless release_date == nil
      errors.add(:release_date, "は、本日を含む過去の日付を入力して下さい") if release_date > Date.today
    end
  end


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
      avg_study_time
    else
      0
    end

    # avg_study_time = reviews.average(:study_time).round
    # return avg_study_time
  end

  # 該当教材のレビュー平均評価を求める
  def calc_to_set_avg_rate
    average = reviews.average(:rate)
    if average
      update!(average_rating: average.round(1))
    else
      update!(average_rating: 0)
    end
  end

  # レビュー件数の多い変数を仮想属性で定義
  ransacker :reviews_count do
    query = <<-SQL
      (SELECT
        COUNT(reviews.id)
       FROM
        reviews
       WHERE
        reviews.material_id = materials.id
        )
    SQL
    Arel.sql(query)
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
    reviews_count
    ]
  end

  # ransackで検索を許可するアソシエーションを指定
  def self.ransackable_associations(auth_object = nil)
     %w[
    category
    material_tags
    tags
    reviews
    ]
  end



  #
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
