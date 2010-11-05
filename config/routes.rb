GameStoreRails3::Application.routes.draw do
  resources :orders
  resources :line_items
  resources :platforms
  resources :users
  resources :editions
  resources :developers
  resources :customers
  resources :games
  resources :publishers
  match '/:controller(/:action(/:id))'
end
