class CreateMaterials < ActiveRecord::Migration[8.1]
  def change
    create_table :materials do |t|
      t.references :category, null: false, foreign_key: true, type: :bigint
      t.string :title, null: false
      t.string :body, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.integer :price, null: false
      t.date :release_date, null: false
      t.string :isbn_number, null: false
      t.float :average_level, null: false, default: 0.0
      t.string :study_level, null: false
      t.timestamps
    end
  end
end
