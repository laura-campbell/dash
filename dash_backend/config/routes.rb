Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trips
      resources :users
      resources :user_trips
    end
  end
  post '/signup', to: 'auth#signup'
  post '/login', to: 'auth#login'
  get '/get_current_user', to: 'auth#get_current_user'
end
