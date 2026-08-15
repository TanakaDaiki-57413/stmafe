class RenameAverageRaitingToAverageRatingInMaterials < ActiveRecord::Migration[8.1]
  def change
    rename_column :materials, :average_raiting, :average_rating
  end
end
