Rails.application.routes.draw do

  devise_for :users
  resources :posts

  match ':controller(/:action(/:id))', :via => :get

  get '/index' => 'home#index', as: 'index'
  get '/viewMap' => 'home#viewMap', as: 'viewMap'
  get '/listView' => 'home#listView', as: 'listView'
  get '/viewHome' => 'home#viewHome', as: 'viewHome'
  get '/aboutUs' => 'home#aboutUs', as: 'aboutUs'
  get '/help' => 'home#help', as: 'help'
  get '/FAQ' => 'home#FAQ', as: 'FAQ'
  get '/feedback' => 'home#feedback', as: 'feedback'
  
  root "home#index"


end
