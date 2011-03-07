Nxface::Application.routes.draw do

  resources :tuans

  get 'kindeditor/images_list'

  post 'kindeditor/upload'

  resources :nodes

  resources :topic_categories

  resources :topics do
    member do
      post :comment
    end
    collection do
      get :search
    end
  end

  resources :users
  
  match "login" => "users#login"
  post "users/login_rst"
  match "logout" => "users#logout"
  match "reg" => "users#reg"
  match "reg_rst" => "users#reg_rst"
  match "reg_re" => "users#reg_re"
  
  match "profile/admin" => "users#edit"
  match "profile/:id/topics" => "users#topics"
  match "profile/:id/comments" => "users#comments"
  match "profile/:id" => "users#show"
  match "topic/:id" => "topics#show"
  match "bookmark/:id" => "bookmarks#show"
  match "category/:id" => "topic_categories#show"
  
  match "search" => "topics#search"
  
  match "post/topic" => "topics#new"
  match "post/bookmark" => "bookmarks#new"
  
  match "admin" => "admin/dashboard#index"
  
  namespace :admin do    
    get "dashboard"
    resources :nodes    
    resources :topic_categories    
    resources :topics    
    resources :bookmarks    
    resources :users    
    post "users/index"
    post "topics/index"
    post "bookmarks/index"
  end

  root :to => "start#index"
  
end
