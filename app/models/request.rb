class Request < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :isbn_number,
             presence: true,
             numericality: { only_integer: true },
             length: { is: 13 }

  # enum設定
  enum :progress_status, { in_progress: 0, rejection: 1, added: 2 }

  def create_request_notification
    create_notification(user_id: user.id)
  end
end
