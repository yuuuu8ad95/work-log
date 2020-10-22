class Document < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :user
  has_many :document_tag_relations, dependent: :destroy
  has_many :tags, through: :document_tag_relations

end
