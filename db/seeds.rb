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

Admin.find_or_create_by!(email_address: ENV.fetch("ADMIN_EMAIL")) do |admin|
  admin.password = ENV.fetch("ADMIN_PASSWORD")
  admin.password_confirmation = ENV.fetch("ADMIN_PASSWORD")
end

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
  "データベース",
  "セキュリティ",
  "テスト",
  "オブジェクト指向",
  "アルゴリズム",
  "初心者向け",
  "入門",
  "実践向け",
  "資格対策",
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
  "アジャイル開発"
]

tags.each do |name|
  Tag.find_or_create_by!(name: name)
end

puts "seedの実行が完了しました"