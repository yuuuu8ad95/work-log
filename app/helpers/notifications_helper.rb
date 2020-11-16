module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_document = link_to 'あなたの投稿', document_path(notification), style: 'font-weight: bold;'
    @visitor_comment = notification.comment_id

    @comment = Comment.find_by(id: @visitor_comment)&.text
    tag.a(@visitor.nickname, href: users_path(@visitor), style: 'font-weight: bold;') + 'さんが' +
      tag.a('こちらの投稿', href: document_path(notification.document_id), style: 'font-weight: bold;') + 'にコメントしました'
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
