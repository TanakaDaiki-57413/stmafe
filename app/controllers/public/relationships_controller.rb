class Public::RelationshipsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[followings followers]
  # フォロー一覧画面
  def followings
  end

  # フォロワー一覧画面
  def followers
  end

  # フォローする処理
  def create
  end

  # フォロー解除の処理
  def destroy
  end
end
