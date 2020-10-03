class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :title,        null:false
      t.text :content,        null:false
      t.date :deadline,       null:false
      t.references :user,     foreign_key: true  

      t.timestamps
    end
  end
end
