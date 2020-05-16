Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'static_pages#home'
get  '/help',    to: 'static_pages#help'
get  '/about',   to: 'static_pages#about'
get  '/contact', to: 'static_pages#contact'
get  '/signup',  to: 'users#new'
get  '/login',   to: 'sessions#new'
post '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
resources :users

# ここから下はAPI研修で使ったやつ
  namespace "api" do
    namespace "v1" do
      resources :products, only: [:index, :show], format: 'json'
      resources :articles, only: [:index, :show], format: 'json'
      resources :users, only: [:index, :show], format: 'json'
    end
  end
end
