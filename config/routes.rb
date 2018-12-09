Rails.application.routes.draw do

  root to: "trips#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :trips do
    resources :stats
    collection do
      get 'distance'
      get 'highest'
    end
  end
end
