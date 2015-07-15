class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question
      t.references :commenter
      t.string :body
      t.boolean :is_best

      t.timestamps null:false
    end
  end
end
