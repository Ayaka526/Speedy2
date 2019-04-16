Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home', as: "home_route"
  get '/feeds/top' => 'feeds#top'
  post '/entry/:id/stocks' =>'stocks#create', as:"stocks_create"
  delete '/entry/:id/stocks' =>'stocks#destroy', as:"stocks_delete"
  get '/stocks' =>'stocks#index', as:"stocks_list"
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

    resources :feeds, only: [:top]do
   	 member do
    	 resources :entries, only: [:index]
    	end
  end

    resources :users do
    get '/mypage' => 'users#mypage'
    get :autocomplete_user_email, on: :collection
  end

   post '/browsing_histories' => "browsing_histories#record"
    resources :browsing_histories, only: [:record, :index, :destroy]

end

