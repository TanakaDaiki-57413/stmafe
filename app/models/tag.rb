class Tag < ApplicationRecord
  # アソシエーション
  has_many :material_tags, dependent: :destroy
  has_many :materials, through: :material_tags

  # バリデーション
  validates :name, presence: true

  # ransackで検索を許可するカラム名を指定
  def self.ransackable_attributes(auth_object = nil)
    %w[
      name
    ]
  end

  # ransackで検索を許可するアソシエーションを指定
  def self.ransackable_associations(auth_object = nil)
     %w[
    materials
    material_tags
    ]
  end
end
