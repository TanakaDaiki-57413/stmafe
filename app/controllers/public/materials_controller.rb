class Public::MaterialsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :set_query, only: [ :index ]
  # 教材一覧画面
  def index
    @materials = @q.result(distinct: true).with_attached_cover_image
    hit_tags?
    flash.now[:alert] = "検索結果がありませんでした" if @materials.blank?
  end

  # 教材詳細画面
  def show
    @material = Material.find(params[:id])
    @q = @material.reviews.order(created_at: :desc).ransack(params[:q])
    @reviews = @q.result(distinct: true).includes(:user)
    @new_review = Review.new
  end

  private
  def set_query
    @q = Material.ransack(params[:q])
    flash.now[:alert] = "検索結果がありませんでした" if @q.result.blank?
  end

  def hit_tags?
    @tag_ids = params[:tag_ids]
    # タグ検索のパラメータ有無を確認
    if @tag_ids.present?
      # パラメータータグの絞込の繰返し
      @tag_ids.reject(&:blank?).each do |tag_id|
        @materials = @materials.includes(:tags)
                               .where(tags: { id: tag_id })
      end
    end
  end
end
