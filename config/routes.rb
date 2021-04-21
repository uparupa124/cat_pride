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
    resources :users, only:[:show, :edit, :update]
    resources :posts, only:[:show, :create] do
     resources :post_comments, only:[:create, :destroy]
   end
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
