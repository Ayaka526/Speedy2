Rails.application.routes.draw do

  devise_for :users
  resources :inquiries, only: [:new, :create, :index, :show, :search]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home', as: "home_route"
  get '/about' => 'home#about', as: "home_about"
  get '/feeds/top' => 'feeds#top'
  post '/entry/:id/stocks' =>'stocks#create', as:"stocks_create"
  delete '/entry/:id/stocks' =>'stocks#destroy', as:"stocks_delete"
  get '/stocks/rank' => 'stocks#rank', as:"stocks_rank"
  get '/stocks' =>'stocks#index', as:"stocks_list"
  post '/browsing_histories' => "browsing_histories#record"
  resources :browsing_histories, only: [:record, :index, :destroy]

    resources :feeds, only: [:top]do
   	 member do
    	 resources :entries, only: [:index]
    	end
  end


    resources :users do
      resources :stocks, :only=>[:index]
    end

    resources :users do
    get '/mypage' => 'users#mypage'
    patch '/admin' => 'users#admin_update'
    get :autocomplete_user_email, on: :collection
  end


end

