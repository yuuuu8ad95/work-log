class Tag < ApplicationRecord
  has_many :document_tag_relations, dependent: :destroy
  has_many :documents, through: :document_tag_relations

  validates :name, uniqueness: true
end
