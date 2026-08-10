class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :nickname, null: false
      t.text :introduction, null: false
      t.integer :active_status, null: false, default: 0
      t.string :public_uid, null: false
      t.timestamps
    end
    add_index :users, :email_address, unique: true
    add_index :users, :public_uid, unique: true
  end
end
