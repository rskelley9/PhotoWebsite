Grokphoto::Application.routes.draw do

  root :to => "home#welcome"

  match 'timestamp' => 'home#timestamp' # used to keep passenger spooled up in prod
  match 'sitemap' => 'home#sitemap'
  match 'blog' => 'home#blog'
  get '/welcome' => 'home#welcome'
  get '/homepage' => 'home#index'

  resources :private_galleries, :only => :show
  resources :galleries, :only => [:show, :index]
  resources :pages, :only => :show
  resources :posts, :only => [:index, :show]
  resources :contact_requests, :only => [:new, :create] do
    get :thanks, :on => :collection
  end
  resources :service_requests, :only => [:new, :create] do
    get :thanks, :on => :collection
  end

  devise_for :photographers

  match 'admin' => 'admin/events#index'
  namespace :admin do
    resources :events, :only => :index
    resource :photographer, :only => [:edit, :update]
    resources :pages
    resources :posts
    resources :galleries
    resources :private_galleries do
      get :invite, :on => :member
      put :send_invite, :on => :member
    end
    resources :photos, :only => [:edit, :update, :destroy] do
      put 'sort', :on => :collection
    end
  end

end
