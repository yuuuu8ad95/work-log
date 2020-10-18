class Tag < ApplicationRecord

  has_many :document_tag_relations
  has_many :documents, through: :document_tag_relations

end
