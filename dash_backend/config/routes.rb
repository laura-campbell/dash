Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

        get '/users/:user_id/trips', to: 'users#users_trips'
        get '/trips/:trip_id/flights', to: 'trips#trip_flights'
        post '/users/:user_id/trips', to: 'trips#create'
        post '/flights', to: 'flights#create'
        get '/flights', to: 'flights#index'
        get '/trips/:id/flights/:id', to: 'flights#show'
        get '/trips/:id', to: 'trips#show'
        delete '/trips/:id/delete', to: 'trips#destroy'
        # post '/users/', to: 'users#create'
        patch '/users/:user_id/trips', to: 'trips#update'
        post '/login/', to: 'authentication#login'
        get '/current_user', to: 'authentication#show'
        post '/signup', to: 'authentication#signup'
        post '/trips/:trip_id/days', to: 'days#create'
        get '/trips/:trip_id/days', to: 'days#trip_days'
        post '/trips/:trip_id/packinglist', to: 'packing_list#create'
        delete '/trips/:trip_id/packinglist/:id/delete', to: 'packing_list#destroy'
        get '/trips/:trip_id/packinglist', to: 'packing_list#trip_items'
        post '/days/:day_id/events', to: 'events#create'
        get '/days/:day_id/events', to: 'events#day_events'
        get '/days/:id', to: 'days#show'

    end
  end
end
