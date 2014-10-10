require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "galleries#index"
  
  resources :galleries do
    resources :images, except: :index do
    end
  end

  constraints Monban::Constraints::SignedIn.new do 
  end

  constraints Monban::Constraints::SignedOut.new do
  end
end