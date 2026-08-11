class Public::MaterialsController < Public::ApplicationController
   allow_unauthenticated_access only: %i[index show]
  # 教材一覧画面
  def index
  end

  # 教材詳細画面
  def show
  end
end
