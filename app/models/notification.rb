class Notification < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :notifiable, polymorphic: true
end
