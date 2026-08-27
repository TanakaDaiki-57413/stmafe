module Public::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Relationship"
      "#{notification.notifiable.follower.nickname}さんにフォローされました"
    when "Request"
      "リクエスト教材のステータスが更新されました"
    end
  end
end
