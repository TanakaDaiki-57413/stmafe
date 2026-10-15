class Public::SearchesController < Public::ApplicationController
  allow_unauthenticated_access only: %i[search]
  # 検索結果画面
  def search
    @q = Material.ransack
    @keyword = params[:keyword]
    @model = params[:model]
    if @model == "user"
      @search_result = User.status_valid.ransack(nickname_cont: params[:keyword]).result(distinct: true).page(params[:page]).per(9)
    elsif @model == "material"
      @search_result = Material.ransack(title_cont: params[:keyword]).result(distinct: true).page(params[:page]).per(8)
    end

    if @search_result.blank?
      flash.now[:alert] = "検索結果はありませんでした"
    end
  end
end
