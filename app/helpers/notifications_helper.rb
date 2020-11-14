module NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_document = link_to 'あなたの投稿', document_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    case notification.action
      when "mark" then
        tag.a(notification.visitor.name, href:users_user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_document_path(notification.document_id), style:"font-weight: bold;")+"確認しました"
      when "comment" then
          @comment = Comment.find_by(id: @visitor_comment)&.text
          tag.a(@visitor.nickname, href:users_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:document_path(notification.document_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
