class Public::MaterialsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[index show]
  # 教材一覧画面
  def index
    @q = Material.ransack(params[:q])

    @materials = @q.result.with_attached_cover_image

    if @q.result.blank?
      flash.now[:alert] = "検索結果がありませんでした"
    end

  end

  # 教材詳細画面
  def show
    @material = Material.find(params[:id])
    @reviews = @material.reviews.includes(:user)
    @new_review = Review.new
  end
end
