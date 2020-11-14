class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :document_id
      t.integer :comment_id
      t.string :action, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
