Rails.application.routes.draw do
  get '/docs' => redirect('/index.html?url=/api/v1/api-docs.json')

  namespace :api do
    namespace :v1 do
      resources :readings
      resources :thermo_stats
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
