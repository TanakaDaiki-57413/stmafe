class Public::NotificationsController < Public::ApplicationController
  # 通知の未読 → 既読処理
  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(is_read: true)

    # 通知の種類によるリダイレクトパスの生成
    case notification.notifiable_type
    when "Relationship"
      redirect_to user_path(notification.notifiable.follower.public_uid)
    when "Request"
      redirect_to request_path(notification.notifiable.id)
    else
      redirect_to root_path
    end
  end
end
