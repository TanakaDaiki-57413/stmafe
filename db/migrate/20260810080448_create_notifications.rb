class CreateNotifications < ActiveRecord::Migration[8.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :notifiable, polymorphic: true, null: false, type: :bigint
      t.boolean :is_read, default: false, null: false
      t.timestamps
    end
  end
end
