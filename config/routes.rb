Rails.application.routes.draw do
  
  devise_for :admin,controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations"
  }

  devise_for :users,controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }

  namespace :admin do
    root to: "homes#top"
    resources :users, only:[:show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    resources :users, only:[:show, :edit, :update] do
      get :followings, on: :member
      get :followers, on: :member
      get :search, on: :collection
    end
    resources :posts, only:[:show, :create] do
      resource :favorites, only:[:create, :destroy]
      resources :post_comments, only:[:create, :destroy]
   end
   resources :relationships, only:[:create, :destroy]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
