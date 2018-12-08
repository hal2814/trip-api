Rails.application.routes.draw do
  resources :trips do
    resources :stats
  end
end
