class Public::HomesController < Public::ApplicationController
   allow_unauthenticated_access only: %i[top]
  def top
    # 新着レビューを4件取得
    @reviews = Review.includes(:material,:user)
                     .order(id: :desc)
                     .first(4)
  end
end
