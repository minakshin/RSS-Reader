Rails.application.routes.draw do
  root 'feeds#index'
  resources :entries

  resources :feeds

end
