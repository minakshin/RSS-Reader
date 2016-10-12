Rails.application.routes.draw do
  root 'feeds#index'

  resources :feeds
  resources :entries do
    get :rss_reader, on: :collection
  end
end
