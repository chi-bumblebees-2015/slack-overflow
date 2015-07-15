class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :answerer
      t.string :body
      t.boolean :is_best

      t.timestamps null: false
    end
  end
end
