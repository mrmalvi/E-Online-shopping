Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "welcome#index"

  post "/callbacks", to: "callbacks#create", as: :razorpay_callback

  namespace :admin do
    resource :dashboard
  end

  namespace :users do
    scope "(:user_id)" do
      resources :orders, only: [:show, :index, :new, :create] do
        collection do
          post :buy_now
        end
      end
    end
    resources :line_items, only: [:create, :destroy, :update, :destroy]
    resources :carts
    resources :payments, only: [:create]
    resources :users
    resources :products
    resource :dashboard
  end
end
