# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "seedの実行を開始"

# ユーザーサンプルデータ
olivi = User.find_or_create_by!(email_address: "olivi@example.com") do |user|
  user.nickname = "olivi"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

yuka = User.find_or_create_by!(email_address: "yuka@example.com") do |user|
  user.nickname = "yuka"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

taro = User.find_or_create_by!(email_address: "taro@example.com") do |user|
  user.nickname = "taro"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

teru = User.find_or_create_by!(email_address: "teru@example.com") do |user|
  user.nickname = "teru"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user2.png")
end

ryu = User.find_or_create_by!(email_address: "ryu@example.com") do |user|
  user.nickname = "ryu"
  user.introduction = "3年目エンジニア アプリ設計を勉強中"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

juju = User.find_or_create_by!(email_address: "juju@example.com") do |user|
  user.nickname = "juju"
  user.introduction = "1年目エンジニア Rubyを勉強中"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

sun = User.find_or_create_by!(email_address: "sun@example.com") do |user|
  user.nickname = "sun"
  user.introduction = "2年目エンジニア AWSを勉強中"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")
end

L = User.find_or_create_by!(email_address: "L@example.com") do |user|
  user.nickname = "L"
  user.introduction = "2年目エンジニア DBを勉強中"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

yukki = User.find_or_create_by!(email_address: "yukki@example.com") do |user|
  user.nickname = "ゆっきー"
  user.introduction = "未経験エンジニア"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

# 管理者
Admin.find_or_create_by!(email_address: ENV.fetch("ADMIN_EMAIL")) do |admin|
  admin.password = ENV.fetch("ADMIN_PASSWORD")
  admin.password_confirmation = ENV.fetch("ADMIN_PASSWORD")
end

# タグ
tags = [
  "Ruby",
  "Ruby on Rails",
  "JavaScript",
  "TypeScript",
  "HTML",
  "CSS",
  "Bootstrap",
  "SQL",
  "MySQL",
  "PostgreSQL",
  "Git",
  "GitHub",
  "Linux",
  "AWS",
  "Docker",
  "API",
  "REST API",
  "Web開発",
  "フロントエンド",
  "バックエンド",
  "ネットワーク",
  "セキュリティ",
  "テスト",
  "オブジェクト指向",
  "アルゴリズム",
  "ポートフォリオ",
  "React",
  "Vue.js",
  "Node.js",
  "Python",
  "PHP",
  "Java",
  "C#",
  "CI/CD",
  "クラウド",
  "アジャイル開発",
  "チュートリアル"
]

tags.each do |name|
  Tag.find_or_create_by!(name: name)
end

categories = [
  "プログラミング言語",
  "インフラ/クラウド",
  "データベース",
  "Web開発",
  "アプリ開発",
  "ソフトウェア設計",
  "資格対策",
  "AI"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end


# 教材

materials = [
  {
    title: "はじめてのRubyプログラミング",
    body: "Rubyの基本文法から変数、条件分岐、繰り返し、メソッドまでを段階的に学べる入門教材です。",
    author: "架空 太郎",
    publisher: "サンプル技術出版",
    price: 2800,
    release_date: "2025-04-01",
    isbn_number: "0000000000001",
    study_level: "初級",
    category: "プログラミング言語",
    tags: ["Ruby", "チュートリアル"]
  },

  {
    title: "Rubyで学ぶオブジェクト指向",
    body: "クラスやインスタンス、継承、モジュールなどRubyのオブジェクト指向を中心に学ぶ教材です。",
    author: "架空 花子",
    publisher: "サンプル技術出版",
    price: 3200,
    release_date: "2025-05-15",
    isbn_number: "0000000000002",
    study_level: "中級",
    category: "プログラミング言語",
    tags: ["Ruby", "バックエンド", "オブジェクト指向"]
  },

  {
    title: "RailsではじめるWebアプリ開発",
    body: "Ruby on Railsを使ってWebアプリケーションを開発するための基本的な流れを学べます。",
    author: "開発 太郎",
    publisher: "架空出版",
    price: 3500,
    release_date: "2025-06-10",
    isbn_number: "0000000000003",
    study_level: "初級",
    category: "Web開発",
    tags: ["Ruby on Rails", "バックエンド"]
  },

  {
    title: "Railsモデル設計入門",
    body: "Active Record、アソシエーション、バリデーション、マイグレーションなどを中心に学ぶ教材です。",
    author: "開発 次郎",
    publisher: "架空出版",
    price: 3800,
    release_date: "2025-07-20",
    isbn_number: "0000000000004",
    study_level: "初級",
    category: "Web開発",
    tags: ["Ruby on Rails", "バックエンド", "データベース", "実践"]
  },

  {
    title: "SQL基礎トレーニング",
    body: "SELECT文やWHERE、ORDER BY、JOINなどデータベース操作の基本を練習できます。",
    author: "データ 花子",
    publisher: "サンプル技術出版",
    price: 2600,
    release_date: "2025-03-12",
    isbn_number: "0000000000005",
    study_level: "初級",
    category: "データベース",
    tags: ["SQL", "実践", "チュートリアル"]
  },

  {
    title: "データベース設計の基本",
    body: "テーブル設計、主キー、外部キー、正規化などデータベース設計の基礎を学べる教材です。",
    author: "データ 太郎",
    publisher: "架空出版",
    price: 3100,
    release_date: "2025-08-05",
    isbn_number: "0000000000006",
    study_level: "初級",
    category: "データベース",
    tags: ["バックエンド", "実践"]
  },

  {
    title: "AWSクラウド入門",
    body: "クラウドコンピューティングの基本からAWSの代表的なサービスまでを学べる教材です。",
    author: "クラウド 一郎",
    publisher: "サンプル技術出版",
    price: 3600,
    release_date: "2025-02-18",
    isbn_number: "0000000000007",
    study_level: "初級",
    category: "インフラ/クラウド",
    tags: ["AWS", "クラウド", "バックエンド"]
  },

  {
    title: "AWSでWebアプリを公開する",
    body: "クラウド上にWebアプリケーションを構築し、公開するまでの流れを学べる実践教材です。",
    author: "クラウド 二郎",
    publisher: "架空出版",
    price: 4200,
    release_date: "2025-09-01",
    isbn_number: "0000000000008",
    study_level: "中級",
    category: "Web開発",
    tags: ["AWS", "クラウド", "バックエンド", "実践"]
  },

  {
    title: "HTMLとCSSの基礎",
    body: "HTMLによるページ構造とCSSによる装飾を基礎から学習できる初心者向け教材です。",
    author: "ウェブ 花子",
    publisher: "サンプル技術出版",
    price: 2200,
    release_date: "2025-01-10",
    isbn_number: "0000000000009",
    study_level: "初級",
    category: "プログラミング言語",
    tags: ["HTML/CSS", "フロントエンド", "チュートリアル"]
  },

  {
    title: "レスポンシブWebデザイン実践",
    body: "PCやスマートフォンなど異なる画面サイズに対応したWebページの制作方法を学べます。",
    author: "ウェブ 次郎",
    publisher: "架空出版",
    price: 2900,
    release_date: "2025-10-10",
    isbn_number: "0000000000010",
    study_level: "中級",
    category: "Web開発",
    tags: ["HTML/CSS", "フロントエンド", "実践"]
  },

  {
    title: "JavaScriptプログラミング入門",
    body: "JavaScriptの基本文法からDOM操作、イベント処理までを段階的に学べる教材です。",
    author: "スクリプト 太郎",
    publisher: "サンプル技術出版",
    price: 3000,
    release_date: "2025-04-25",
    isbn_number: "0000000000011",
    study_level: "初級",
    category: "プログラミング言語",
    tags: ["Javascript", "フロントエンド", "チュートリアル"]
  },

  {
    title: "JavaScriptで作るインタラクティブWeb",
    body: "JavaScriptを利用してユーザー操作に反応するWebページを制作する実践教材です。",
    author: "スクリプト 花子",
    publisher: "架空出版",
    price: 3400,
    release_date: "2025-11-01",
    isbn_number: "0000000000012",
    study_level: "中級",
    category: "プログラミング言語",
    tags: ["Javascript", "フロントエンド", "実践"]
  }
]



materials.each do |data|
  category = Category.find_by!(name: data[:category])

  material = Material.find_or_create_by!(
    title: data[:title],
    body: data[:body],
    author: data[:author],
    publisher: data[:publisher],
    price: data[:price],
    release_date: data[:release_date],
    isbn_number: data[:isbn_number],
    study_level: data[:study_level],
    category: category
  )

  material.cover_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-book.jpg"),filename: "sample-book.jpg"
)

  data[:tags].each do |tag_name|
    tag = Tag.find_or_create_by!(name: tag_name)

    MaterialTag.find_or_create_by!(
      material: material,
      tag: tag
    )
  end
end

puts "seedの実行が完了しました"