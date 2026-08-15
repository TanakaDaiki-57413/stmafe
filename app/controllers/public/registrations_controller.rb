class Public::RegistrationsController <  Public::ApplicationController
   allow_unauthenticated_access only: %i[new create]
  # ユーザー新規登録画面
  def new
    @user = User.new
  end

  # ユーザー新規登録処理
  def create
    @user = User.new(user_params)


    if @user.save
      start_new_session_for @user
      redirect_to after_authentication_url,
                  notice: "ログインに成功しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email_address,
      :password,
      :password_confirmation,
      :terms_of_service
    )
  end
end
