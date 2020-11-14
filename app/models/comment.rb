class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :document
  validates :text, presence: true
  has_many :notifications, dependent: :destroy
end
