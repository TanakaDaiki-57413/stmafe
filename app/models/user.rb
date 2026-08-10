class User < ApplicationRecord
  # --アソシエーション
  # 認証機能
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  # リレーションシップ(フォロー・フォロワー)
  has_many :relationships,class_name: "Relationship",foreign_key: "follower_id"
  has_many :followings,through: :relationships,source: :followed

  has_many :reverse_of_relationships,class_name: "Relationship",foreign_key: "followed_id"
  has_many :followers, through: :reverse_of_relationships,source: :follower

  # ブックマーク
  has_many :bookmarks

  # 教材リクエスト
  has_many :requests

  # レビュー
  has_many :reviews

  # 通知
  has_many :notifications


  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
