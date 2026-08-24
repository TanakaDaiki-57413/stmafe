class Public::BookMarksController < Public::ApplicationController
  before_action :set_one_material, only: [ :create, :destroy ]
  def create
    @bookmark = @material.bookmarks.new(user: current_user)
    @bookmark.save
  end

  def destroy
    @bookmark = @material.bookmarks.find_by(user: current_user)
    @bookmark.destroy
  end

  private
  def set_one_material
    @material = Material.find(params[:material_id])
  end
end
