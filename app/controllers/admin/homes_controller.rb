class Admin::HomesController < Admin::ApplicationController
  # トップページ(教材リクエスト一覧画面)
  def top
    @requests = Request.order(created_at: :desc)
  end
end
