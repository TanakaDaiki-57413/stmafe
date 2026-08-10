class Request < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one :notification, as: :notifiable, dependent: :destroy

  # enum設定
  enum :progress_status, { in_progress: 0, rejection: 1, added: 2 }
end
