class Public::ReviewsController < Public::ApplicationController
  before_action :set_one_review, only: [ :edit, :update, :destroy ]
  # レビュー編集画面
  def edit
    # @return_toの値に遷移元のURLが格納
    @material = Material.find(params[:material_id])
    @return_to = params[:return_to]
  end

  # レビュー作成処理
  def create
    @new_review = Review.new(review_param)
    @material = Material.find(params[:material_id])

    @new_review.user = current_user
    @new_review.material = @material

    if @new_review.save
      redirect_to material_path(@material), notice: "レビュー投稿に成功しました"
    else
      @q = @material.reviews.order(created_at: :desc).ransack(params[:q])
      @reviews = @q.result.includes(:user)
      render "public/materials/show", status: :unprocessable_entity
    end
  end

  # レビュー内容の変更処理
  def update
    @material = Material.find(params[:material_id])
    if @review.update(review_param)
      redirect_to params[:return_to].presence || root_path, notice: "レビューを更新しました"
    else
      @return_to = params[:return_to]
      render "edit", status: :unprocessable_entity
    end
  end

  # レビューの削除処理
  def destroy
    @review.destroy
    redirect_back(fallback_location: root_path, notice: "レビューの削除に成功しました")
  end

  private
  def review_param
    params.require(:review).permit(
      :content,
      :rate,
      :study_time,
      :material
    )
  end

  def set_one_review
    @review = Review.find(params[:id])
  end
end
