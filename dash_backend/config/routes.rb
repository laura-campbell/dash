Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :trips
        # get '/trips/', to: 'trips#index'
        #
        get '/users/:user_id/trips', to: 'users#users_trips'
        # delete '/users/:user_id/trips/:users_trip_id', to: 'users#users_trips'

        # post '/users/', to: 'users#create'
        post '/login/', to: 'authentication#create'
        get '/current_user', to: 'authentication#show'
    end
  end
end
