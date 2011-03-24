Xingjibuy::Application.routes.draw do

  resources :deals

  get 'kindeditor/images_list'
  post 'kindeditor/upload'
  
  match "buy/:id" => "buy#index"
  match "cart" => "buy#cart"
  match "record_cart" => "buy#record_cart"
  match "delivery" => "buy#delivery"
  match "record_delivery" => "buy#record_delivery"
  match "pay" => "buy#pay"
  
  #get "about"
  match "about" => "about#index"
  match "faq" => "about#faq"
  match "rule" => "about#rule"
  match "blog" => "about#blog"
  match "contact" => "about#contact"
  match "private" => "about#private"
  match "commitment" => "about#commitment"
  match "terms" => "about#terms"
  
  match "login" => "users#login"
  post "users/login_rst"
  match "logout" => "users#logout"
  match "reg" => "users#reg"
  match "reg_rst" => "users#create"
  match "send_activate_email" => "users#send_activate_email"
  match "activate_account/:id" => "users#activate"

  resources :users
  
  match "search" => "tuans#search"
    
  match "admin" => "admin/dashboard#index"
  
  namespace :admin do    
    get "dashboard"
    resources :deals
    post "deals/index"
    resources :users
    post "users/index"
    resources :run_logs
    post "run_logs/index"
    resources :orders
    post "orders/index"
    resources :carts
    post "carts/index"
  end
  
  root :to => "start#index"
  
  match "*path" => "application#render_not_found"
  
end
