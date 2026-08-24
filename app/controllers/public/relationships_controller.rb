class Public::RelationshipsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[followings followers]
  before_action :set_user, only: [ :followings, :followers ]
  before_action :set_users, only: [ :create, :destroy]
  # フォロー一覧画面
  def followings
    @followings = @user.followings
  end

  # フォロワー一覧画面
  def followers
    @followers = @user.followers
  end

  # フォローする処理
  def create
    current_user.follow(@target_user)

    respond_to do |format|
      format.turbo_stream do
        if params[:from] == "list"
          render "create_list"
        else
          render "create"
        end
      end
    end
  end

  # フォロー解除の処理
  def destroy
    current_user.unfollow(@target_user)
    respond_to do |format|
      format.turbo_stream do
        if params[:from] == "list"
          render "destroy_list"
        else
          render "destroy"
        end
      end
    end
  end

  private
  def set_user
    @user = User.includes(:reviews, :followings, :followers)
                .with_attached_profile_image
                .find_by(public_uid: params[:user_public_uid])
  end

  def set_users
    @target_user = User.find_by(public_uid: params[:user_public_uid])
    @profile_user = User.find_by(public_uid: params[:profile_user_public_uid])
  end
end

# user_relationships DELETE /users/:user_public_uid/relationships(.:format) public/relationships#destroy
#                 POST   /users/:user_public_uid/relationships(.:format)   public/relationships#create
# user_followings GET    /users/:user_public_uid/followings(.:format)      public/relationships#followings
# user_followers GET    /users/:user_public_uid/followers(.:format)       public/relationships#followers

# href="/users/GVrhRTWxeYk/relationships?profile_user_public_uid=MJqoh5svL2A">フォロー中</a>