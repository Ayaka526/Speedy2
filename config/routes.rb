Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home'
  get '/articles/top' => 'articles#top'
  get '/articles/index' => 'articles#index'
  get '/articles/rank' => 'articles#rank'
  get '/articles/stock' => 'articles#stock'

  resources :articles
end
