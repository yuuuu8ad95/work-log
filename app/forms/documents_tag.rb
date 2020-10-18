class DocumentsTag

  include ActiveModel::Model
  attr_accessor :name, :title, :content, :deadline, :create_day, :document_id, :user_id 

  with_options presence: true do
    validates :name
    validates :title
    validates :content
    validates :deadline

  end

  def save
    document = Document.create(title: title, content: content, deadline: deadline)
    tag = Tag.create(name: name)

    DocumentTagRelation.create(document_id: document.id, tag_id: tag.id)
  end

end