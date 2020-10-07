class Comment < ApplicationRecord
  belong_to :user
  belong_to :document
  validates :text, presence: true
end
