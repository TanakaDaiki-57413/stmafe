class Review < ApplicationRecord
  # 各データ処理後にレビュー教材の平均評価を再計算
  after_create :call_update_on_material
  after_update :call_update_on_material
  after_destroy :call_update_on_material

  # アソシエーション
  belongs_to :user
  belongs_to :material

  validates :content, presence: true,
            length: { maximum: 512 }

  validates :study_time, presence: true,
            numericality: { only_integer: true }

  validates :rate, presence: true

  # rateのバリデーションは実装フェーズ3にて

  # ransackで検索を許可するカラム名を指定
  def self.ransackable_attributes(auth_object = nil)
    %w[
      rate
      created_at
      study_time
    ]
  end

  private

  def call_update_on_material
    material.calc_to_set_avg_rate
  end
end
