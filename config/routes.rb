Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'application#hello' # rootアクセスでhelloメソッドの値を返すルーティング

  namespace "api" do
    namespace "v1" do
      resources :products, only: [:index, :show], format: 'json'
      resources :articles, only: [:index, :show], format: 'json'
      resources :users, only: [:index, :show], format: 'json'
    end
  end
end
