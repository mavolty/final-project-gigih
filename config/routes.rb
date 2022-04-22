Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :menus, only: %i[index show create update destroy]
      resources :categories, only: %i[index show create update destroy]
      resources :menu_categories, only: %i[index create update destroy]
      get 'menu_categories/:menu_id', to: 'menu_categories#show'
      resources :customers, only: %i[index show create update destroy]
      resources :orders, only: %i[index show create update destroy]
      resources :line_items, only: %i[index create update destroy]
      get 'line_items/:customer_id', to: 'line_items#show'
      get 'reports', to: 'reports#index'
    end
  end
end
