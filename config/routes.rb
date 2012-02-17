DemoJackpot::Application.routes.draw do
  resources :subscriptions , only: ['index', 'show']
  resources :customers ,     only: ['create', 'show']

  put "/simulate/billing", :to => "simulations#billing", :as => "simulate_billing"
  match "/about", :to => "pages#about"

  mount Jackpot::Engine => "/billing"

  root :to => "subscriptions#index"

end
