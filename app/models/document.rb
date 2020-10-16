class Document < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :mark

  with_options presence: true do
    validates :title
    validates :content
    validates :deadline
  end
end
