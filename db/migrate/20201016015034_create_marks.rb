class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.references :user,         foreign_key: true  
      t.references :document,     foreign_key: true 
      t.timestamps
    end
  end
end
