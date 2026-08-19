class Category < ApplicationRecord
  # アソシエーション
  has_many :materials

  # バリデーション
  validates :name, presence: true

  # materialで検索されるカラムを許可
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
