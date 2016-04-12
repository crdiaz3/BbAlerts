Rails.application.routes.draw do

  devise_for :users
  resources :posts
  
  root "posts#index"
  #get ‘:controller(/:action(/:id))’, :via=> :get

  #get '/viewMap', :to => redirect('app/views/layouts/viewMap.html.erb')
  get '/viewMap', to: 'controller_name#press'

  get '/about', to: 'pages#about'
end
