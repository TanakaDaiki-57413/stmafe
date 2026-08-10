class Request < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one :notification, as: :notifiable, dependent: :destroy
end
