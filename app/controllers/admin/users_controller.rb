class Admin::UsersController < Admin::ApplicationController
  before_action :set_one_user, only: [ :edit, :update ]
  # ユーザー管理一覧画面
  def index
    # 検索結果を@qに格納 該当書籍の画像を事前に取得
    # @params[:q]に値が無い状態だとUser情報全取得
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).with_attached_profile_image
  end

  # ユーザー管理詳細画面
  def show
    @user = User.includes(:reviews)
                 .find(params[:id])
    @q = @user.reviews.order(created_at: :desc).ransack(params[:q])
    @reviews = @q.result(distinct: true).includes(:material)
  end

  # ユーザー管理編集画面
  def edit
  end

  # ユーザー情報編集処理
  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "データ更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :introduction,
      :email_address,
      :active_status
    )
  end

  def set_one_user
    @user = User.find(params[:id])
  end
end
