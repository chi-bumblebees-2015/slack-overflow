class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_hash, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
