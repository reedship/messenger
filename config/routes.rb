Rails.application.routes.draw do
  get 'conversations/all', to: 'conversations#all'
  resources :conversations, only: %i[index show create], as: :conversations do
    resources :messages, as: :messages
  end

  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
