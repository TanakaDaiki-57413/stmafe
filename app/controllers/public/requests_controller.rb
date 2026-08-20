class Public::RequestsController < Public::ApplicationController
  # リクエスト申請画面
  def new
    @request = current_user.requests.new(session[:request_params])
  end

  # リクエスト内容確認画面
  def confirm
    session[:request_params] = request_params.to_h
    @request = current_user.requests.new(session[:request_params])

    # 申請内容のバリデーションチェック
    unless @request.valid?
      render :new, status: :unprocessable_entity
    end
  end

  # リクエスト履歴一覧画面
  def index
    @requests = current_user.requests
  end

  # リクエスト履歴詳細画面
  def show
    @request = current_user.requests.find(params[:id])
  end

  # リクエストデータ作成処理
  def create
    @request = current_user.requests.new(session[:request_params])
    if @request.save
      session.delete(:request_params)
      redirect_to request_path(@request) , notice: "リクエスト作成に成功しました"
    else
      render :new , status: :unprocessable_entity
    end   
  end

  def destroy
    request = current_user.requests.find(params[:id])
    request.destroy
    redirect_to requests_path , notice: "リクエストの取消に成功しました"
  end

  private
  def request_params
    params.require(:request).permit(
      :title,
      :author,
      :publisher,
      :isbn_number
    )
  end
  
end
