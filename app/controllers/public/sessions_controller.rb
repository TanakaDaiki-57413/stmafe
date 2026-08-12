class Public::SessionsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to root_path if authenticated_user?
  end

  def create
    user = authenticate_user

    if user.nil?
      redirect_to new_user_session_path,
                  alert: "メールアドレスまたはパスワードが正しくありません"
    elsif user.status_invalid?
      redirect_to new_user_session_path,
                  alert: "このアカウントは退会済みです"
    elsif user.status_prohibited?
      redirect_to new_user_session_path,
                  alert: "このアカウントは利用停止中です"
    else
      start_new_session_for user
      redirect_to after_authentication_url,
                  notice: "ログインに成功しました"
    end
  end

  def destroy
    terminate_session
    redirect_to root_path, notice: "ログアウトに成功しました"
  end

  private

  def authenticate_user
    User.authenticate_by(params.require(:user).permit(:email_address, :password))
  end
end
