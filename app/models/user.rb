class User < ApplicationRecord
  before_validation :normalize_email
  before_validation :generate_public_uid, on: :create

  # --アソシエーション
  # 認証機能
  has_secure_password
  has_many :sessions, dependent: :destroy

  # リレーションシップ(フォロー・フォロワー)
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followings, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # ブックマーク
  has_many :bookmarks

  # 教材リクエスト
  has_many :requests

  # レビュー
  has_many :reviews

  # 通知
  has_many :notifications

  # プロフィール画像をユーザーレコードに添付
  has_one_attached :profile_image

  # enum設定
  enum :active_status, { status_valid: 0, status_invalid: 1, status_prohibited: 2 }

  # 仮想属性の追加
  attr_accessor :terms_of_service

  # バリデーション
  validates :terms_of_service, acceptance: true

  validates :nickname, presence: true, length: { maximum: 20 }

  validates :email_address,
            presence: true,
            uniqueness: { case_sensitive: true },
            format: { with: URI::MailTo::EMAIL_REGEXP }


  validates :password,
            length: { minimum: 6 },
            allow_nil: true

  validates :introduction, length: { maximum: 512 }


  # 画像表示処理
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_fill: [ width, height ]).processed
  end

  # active_statusの値を返す処理
  def login_available?
    status_invalid?
  end

  private
  # メールアドレス入力時空白の消去
  def normalize_email
    self.email_address = email_address.to_s.strip
  end

  # ユーザーデータ生成時に公開用IDカラムにランダムな文字列を格納
  def generate_public_uid
    self.public_uid ||= SecureRandom.urlsafe_base64(8)
  end
end
