class Document < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :user

  with_options presence: true do
    validates :title
    validates :content
    validates :deadline
  end
end
