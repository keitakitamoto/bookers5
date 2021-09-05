Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # 上から順番に起動する
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
      resource :favorites, only: [:create,:destroy]
      resources :book_comments, only: [:create,:destroy]
    end
  end
# end抜け