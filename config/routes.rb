DemoJackpot::Application.routes.draw do
  get "subscriptions/index"

  mount Jackpot::Engine => "/billing"
end
