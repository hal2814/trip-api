Rails.application.routes.draw do

  root to: "trips#index"

  resources :trips do
    resources :stats
    collection do
      get 'distance'
      get 'highest'
    end
  end
end
