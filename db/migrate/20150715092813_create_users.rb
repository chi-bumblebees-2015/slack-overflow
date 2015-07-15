class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_hash
      t.string :email

      t.timestamps null: false
    end
  end
end
