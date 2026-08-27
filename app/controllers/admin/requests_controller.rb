class Admin::RequestsController < Admin::ApplicationController
  before_action :set_one_request, only: [ :show, :update ]
  # 教材リクエスト詳細画面
  def show
  end

  # 教材リクエストのステータス更新
  # 管理者の返信内容の作成
  def update
    if @request.update(request_params)
      @request.create_request_notification
      redirect_to admin_root_path, notice: "リクエストの更新に成功しました"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
  def set_one_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(
      :reply,
      :progress_status
    )
  end
end
