class Review < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :material

  validates :content, presence: true, 
            length: { maximum: 512 }
  
  validates :study_time, presence: true,
            numericality: { only_integer: true }
  
  # rateのバリデーションは実装フェーズ3にて
  
end
