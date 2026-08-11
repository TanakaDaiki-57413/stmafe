class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.string :content, null: false
      t.integer :study_time, null: false
      t.float :rate, null: false
      t.timestamps
    end
  end
end
