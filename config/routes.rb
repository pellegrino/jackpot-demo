DemoJackpot::Application.routes.draw do
  resources :subscriptions , only: ['index', 'show']
  resources :customers ,     only: ['create', 'show']

  mount Jackpot::Engine => "/billing"

  root :to => "subscriptions#index"

end
