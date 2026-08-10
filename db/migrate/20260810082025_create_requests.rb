class CreateRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.string :isbn_number, null: false
      t.integer :progress_status, null: false, default: 0
      t.text :reply
      t.timestamps
    end
  end
end
