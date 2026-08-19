class MaterialTag < ApplicationRecord
  # アソシエーション
  belongs_to :material
  belongs_to :tag

  # ransackで検索を許可するアソシエーションを指定
  def self.ransackable_associations(auth_object = nil)
     %w[
    materials
    tags
    ]
  end
end
