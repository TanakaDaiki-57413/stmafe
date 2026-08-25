class Public::ApplicationController < ApplicationController
  include Public::Authentication
  before_action :set_header_notifications

  private

  def set_header_notifications
    # 例: ログイン中のユーザーがいれば、その未読通知を取得する
    if current_user
      @notifications = current_user.notifications.where(is_read: false)
                                                 .order(created_at: :desc)
                                                 .limit(5)
    else
      @notifications = []
    end
  end
end
