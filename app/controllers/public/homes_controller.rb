class Public::HomesController < Public::ApplicationController
  allow_unauthenticated_access only: %i[top]
  def top
    @q = Material.ransack

    # 新着レビューを4件取得
    @reviews = Review.includes(:material, :user)
                     .order(id: :desc)
                     .first(4)

    @popular_materials = Material.order(average_rating: :desc)
                                 .first(5)
  end
end
