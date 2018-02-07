Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/current_user', to: 'sessions#show'

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destory'

      post '/signup', to: 'users#create'

      get '/users', to: 'users#index'
      put '/users/:id', to: 'users#update'
      delete '/users/:id', to: 'users#destroy'

      post '/new_post', to: 'posts#create'
      get '/posts', to: 'posts#index'
      put '/posts/:id', to: 'posts#update'
      delete '/posts/:id', to: 'posts#destroy'

      post '/posts/:post_id/comments', to: 'posts#comment_create'
      get '/posts/:post_id/comments', to: 'posts#comment_index'
      delete '/posts/:post_id/comments/:id', to: 'posts#comment_destroy'

      post '/new_event', to: 'events#create'
      get '/events', to: 'events#index'
      put '/events/:id', to: 'events#update'
      delete '/events/:id', to: 'events#destroy'

      post '/events/:event_id/connected', to: 'events#create_connected'
      get '/events/connected', to: 'events#connected_index'

      get '/user_events', to: 'user_events#index'

      post '/new_hour_log', to: 'hour_logs#create'
      get '/hour_log/:id', to: 'hour_logs#show'
      put '/hour_log/:id', to: 'hour_logs#update'
      delete '/hour_log/:id', to: 'hour_logs#destroy'

    end
  end

end
