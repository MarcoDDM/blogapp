Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :user_posts, only: [:index, :show]
  end
end
