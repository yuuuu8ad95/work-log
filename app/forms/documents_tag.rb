class DocumentsTag
  include ActiveModel::Model
  attr_accessor :create_day, :title, :content, :deadline, :document_id, :user_id, :name

  with_options presence: true do
    validates :create_day
    validates :title
    validates :content
    validates :deadline
    validates :name
    validates :user_id
  end

  def save
    return false if invalid?

    document = Document.create(create_day: create_day, title: title, content: content, deadline: deadline, user_id: user_id)
    document.save
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    DocumentTagRelation.create(document_id: document.id, tag_id: tag.id)
  end
end
