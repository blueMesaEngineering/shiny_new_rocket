Rails.application.routes.draw do
  # resources :datapoints
  # resources :stocks

  namespace :api do
    namespace :v1 do
      resources :datapoints
      resources :stocks
    end
  end
  
  namespace :api do
    namespace :v2 do
      resources :datapoints
      resources :stocks
    end
  end

end
