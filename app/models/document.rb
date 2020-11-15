class Document < ApplicationRecord
  belongs_to :user
  has_many :notifications
  has_many :comments, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :user
  has_many :document_tag_relations, dependent: :destroy
  has_many :tags, through: :document_tag_relations

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(document_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      document_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


end
