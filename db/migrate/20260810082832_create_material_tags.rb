class CreateMaterialTags < ActiveRecord::Migration[8.1]
  def change
    create_table :material_tags do |t|
      t.references :material, null: false, foreign_key: true, type: :bigint
      t.references :tag, null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
