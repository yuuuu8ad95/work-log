class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :document
  validates_uniqueness_of :document_id, scope: :user_id

  def marked_by?(user)
    marks.where(user_id: user.id).exists?
  end
end
