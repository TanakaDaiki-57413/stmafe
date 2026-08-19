class Public::MaterialsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[index show]
  # 教材一覧画面
  def index
    @materials = Material.with_attached_cover_image
  end

  # 教材詳細画面
  def show
    @material = Material.find(params[:id])
    @reviews = @material.reviews.includes(:user)
    @new_review = Review.new
  end
end
