Rails.application.routes.draw do

  get 'user/update'

  resources :stories do
    resources :comments
  end
end
