require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  root "application#index"
  
  resources :galleries do
    resources :images, except: [:index]
  end

  resources :images, only: [] do
    resources :comments, only: [:create]
  end

  resources :groups do
    member do
      post "/join" => "group_memberships#create"
      delete "/leave" => "group_memberships#destroy"
    end
  end

  constraints Monban::Constraints::SignedIn.new do 
  end

  constraints Monban::Constraints::SignedOut.new do
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end