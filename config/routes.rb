Rails.application.routes.draw do
  # 管理者ログイン
  get "admin/sign_in", to: "admin/sessions#new", as: :new_admin_session
  post "admin/sign_in", to: "admin/sessions#create", as: :admin_session
  delete "admin/sign_out", to: "admin/sessions#destroy", as: :destroy_admin_session

  # ユーザーログイン/ログアウト
  get "users/sign_in", to: "public/sessions#new", as: :new_user_session
  post "users/sign_in", to: "public/sessions#create", as: :user_session
  delete "users/sign_out", to: "public/sessions#destroy", as: :destroy_user_session

  # ユーザー新規登録
  get "users/sign_up", to: "public/registrations#new", as: :new_user_registration
  post "users", to: "public/registrations#create",as: :user_registration

  # 管理者側のルーティング
  namespace :admin do
    # トップページ(教材リクエスト一覧画面)
    root to: "homes#top"

    # 教材リクエスト詳細画面・データ更新
    resources :requests, only: [ :show, :update ]

    # カテゴリ一覧・編集画面 各データ処理
    resources :categories, only: [ :index, :edit, :create, :update ]

    # タグ一覧・編集画面 各データ処理
    resources :tags, only: [ :index, :edit, :create, :update ]

    # ユーザー各画面 データ更新
    resources :users, only: [ :index, :show, :edit, :update ]

    # 教材各画面 各データ処理 addは教材追加画面
    resources :materials, only: [ :index, :show, :edit, :create, :update, :destroy ] do
      get :add, on: :collection
    end

    # レビュー各画面 データ削除
    resources :reviews, only: [ :index, :show, :destroy ]
  end

  # ユーザー側のルーティング
  scope module: :public do
    root to: "homes#top"

    # 検索画面
    get "search", to: "searches#search"

    # ユーザー編集画面・データ更新
    get   "users/profile/edit", to: "users#edit"
    patch "users/profile",      to: "users#update"

    # ユーザー退会確認画面・データ更新
    get   "users/unsubscribe",  to: "users#unsubscribe"
    patch "users/withdraw",     to: "users#withdraw"

    # ユーザー一覧・詳細など
    resources :users, param: :public_uid, only: [ :index, :show ] do
      # フォロー周り
      resource :relationships, only: [ :create, :destroy ]

      get "followings" => "relationships#followings"
      get "followers" => "relationships#followers"

      # お気に入り一覧
      get "bookmarking" => "users#bookmarking"

      # レビュー一覧
      get "reviewing" => "users#reviewing"
    end

    # 教材一覧・詳細
    resources :materials, only: [ :index, :show ] do
      # レビュー編集画面・各データ処理
      resources :reviews, only: [ :edit, :create, :update, :destroy ]
    end

    # 通知
    resources :notifications, only: [ :update ]

    # 教材リクエスト 各画面・各データ処理
    resources :requests, only: [ :new, :index, :show, :create, :destroy ] do
      get "confirm", to: "requests#confirm"
    end
  end
end
