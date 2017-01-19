Rails.application.routes.draw do
  resources :tags
  resources :stories do
    resources :comments
  end
end
