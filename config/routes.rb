Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
