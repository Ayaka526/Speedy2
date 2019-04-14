Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home', as: "home_route"
  get '/feeds/top' => 'feeds#top'

    resources :feeds do
   	 member do
    	 resources :entries, only: [:index, :top]
    	end
  end

    resources :users do
    get '/mypage' => 'users#mypage'
    get :autocomplete_user_email, on: :collection
  end

   post '/browsing_histories' => "browsing_histories#record"
    resources :browsing_histories, only: [:record, :index]

end

