class Public::UsersController < Public::ApplicationController
  allow_unauthenticated_access only: %i[index show bookmariking reviewing]

  # ユーザー一覧画面
  def index
    # 利用中ユーザーを取得かつN+1問題防止のためプロフィール画像を事前に読込
    @users = User.status_valid.with_attached_profile_image
  end

  # ユーザー詳細画面
  def show
    @user = User.find_by(public_uid: params[:public_uid])
  end

  # プロフィール編集画面
  def edit
    @user = current_user
  end

  # 退会確認画面
  def unsubscribe
  end

  # お気に入り一覧画面
  def bookmariking
  end

  # レビュー一覧画面
  def reviewing
  end

  # ユーザープロフィール編集内容の更新処理
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.public_uid), notice: "更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ユーザー退会処理
  def withdraw
   user = User.find(current_user.id)

    ActiveRecord::Base.transaction do
      user.update!(active_status: 1,
                  email_address: "withdrawn_#{user.id}@example.com",
                  nickname: "退会済みユーザー")

      user.bookmarks.destroy_all
      user.notifications.destroy_all
      user.relationships.destroy_all
      user.reverse_of_relationships.destroy_all
    end

    terminate_session
    redirect_to new_user_session_path, notice: "退会処理に成功しました"
  end

  private

  def user_params
    params.require(:user).permit(
      :profile_image,
      :nickname,
      :introduction,
      :email_address
    )
  end
end
