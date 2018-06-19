Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

        # get '/trips/', to: 'trips#index'
        #
        get '/users/:user_id/trips', to: 'users#users_trips'
        get '/trips/:trip_id/flights', to: 'trips#trip_flights'
        post '/users/:user_id/trips', to: 'trips#create'
        post '/flights', to: 'flights#create'
        get '/flights', to: 'flights#index'
        get '/trips/:id/flights/:id', to: 'flights#show'
        get '/trips/:id', to: 'trips#show'

        # delete '/users/:user_id/trips/:users_trip_id', to: 'users#users_trips'

        # post '/users/', to: 'users#create'
        post '/login/', to: 'authentication#create'
        get '/current_user', to: 'authentication#show'

    end
  end
end
