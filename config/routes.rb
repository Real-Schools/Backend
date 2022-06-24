Rails.application.routes.draw do
  devise_for :students
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
   namespace :api do
    namespace :v1 do
      match 'home' => "home#index", via: [:get]
      match 'users' => "users#index", via: [:get]
      match 'user/:id' => "users#show", via: [:get]
      match 'current_user' => "users#current", via: [:get]
    end
  end
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match '*path', :to => 'application#routing_error', via: [:all]
  get '*unmatched_route', to: 'application#raise_not_found!'
  post '*unmatched_route', to: 'application#raise_not_found!'
  put '*unmatched_route', to: 'application#raise_not_found!'
  delete '*unmatched_route', to: 'application#raise_not_found!'
end
