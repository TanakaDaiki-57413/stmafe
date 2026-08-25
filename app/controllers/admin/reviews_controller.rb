class Admin::ReviewsController < Admin::ApplicationController
  # レビュー管理一覧画面
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result.includes(:material, :user)
  end

  # レビュー管理詳細画面
  def show
    @review = Review.find(params[:id])
  end

  # レビュー削除処理
  def destroy
    review = Review.find(params[:id])
    review.destroy

    if params[:review_show_value]
      # レビュー詳細画面からdesroy処理後の遷移先指定
      redirect_to admin_reviews_path, notice: "レビューの削除に成功しました"
    else
      redirect_back(fallback_location: admin_reviews_path, notice: "レビューの削除に成功しました")
    end
  end
end
