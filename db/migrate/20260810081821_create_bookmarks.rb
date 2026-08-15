class CreateBookmarks < ActiveRecord::Migration[8.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :material, null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
