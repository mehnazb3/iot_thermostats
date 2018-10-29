Rails.application.routes.draw do
  resources :readings
  resources :thermo_stats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
