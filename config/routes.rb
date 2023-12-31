Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  root 'lists#index'
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[create]
  end

  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: 'delete_bookmark'
end
