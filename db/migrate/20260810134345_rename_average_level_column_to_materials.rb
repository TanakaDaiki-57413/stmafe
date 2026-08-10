class RenameAverageLevelColumnToMaterials < ActiveRecord::Migration[8.1]
  def change
     rename_column :materials, :average_level, :average_raiting
  end
end
