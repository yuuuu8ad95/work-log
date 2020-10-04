class Document < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :create_day
    validates :title
    validates :content
    validates :deadline
  end
end
