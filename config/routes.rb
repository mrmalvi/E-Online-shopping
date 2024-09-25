Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"

  namespace :admin do
    resource :dashboard
  end

  namespace :users do
    scope "(:user_id)" do
      resources :orders
    end
    resources :users
    resources :products
    resource :dashboard
  end
end
