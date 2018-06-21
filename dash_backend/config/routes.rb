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
        delete '/trips/:id/delete', to: 'trips#destroy'
        # post '/users/', to: 'users#create'
        post '/login/', to: 'authentication#login'
        get '/current_user', to: 'authentication#show'
        post '/signup', to: 'authentication#signup'
        post '/trips/:id/itinerary', to: 'days#create'

    end
  end
end
