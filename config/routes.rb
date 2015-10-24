
Depo1::Application.routes.draw do
  
  resources :wishlists


  get "reviews/create"

  get 'admin' => 'admin#index'

  post "wishlists/edit"

  

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :orders

  resources :line_items

  resources :carts

  get "store/index"
  post "line_items/review"

  resources :reviews do
  end

  resources :products do
    get :who_bought, on: :member
  end
end
