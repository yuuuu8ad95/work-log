class CreateDocumentTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :document_tag_relations do |t|
      t.references :document,     foreign_key: true
      t.references :tag,          foreign_key: true
      t.timestamps
    end
  end
end
