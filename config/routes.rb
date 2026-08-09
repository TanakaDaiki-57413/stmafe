Rails.application.routes.draw do
  #管理者側のルーティング
  namespace :admin do
    root to: "homes#top"

    resources :requests, only: [ :show, :update ]
    resources :categories, only: [ :index, :edit, :create, :update ]
    resources :tags, only: [ :index, :edit, :create, :update ]
    resources :users, only: [ :index, :show, :edit, :update ]
    resources :materials, only: [ :index, :show, :edit, :create, :update, :destroy ] do
      get :add, on: :collection
    end
    resources :reviews, only: [ :index, :show, :destroy ]
  end
end
