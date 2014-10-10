Rails.application.routes.draw do
  root "galleries#index"
  
  resources :galleries do
    resources :images, except: :index do
    end
  end
end