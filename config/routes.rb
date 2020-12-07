# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :service_areas
    resources :allowed_post_codes

    root to: 'service_areas#index'
  end
  root 'eligibility_checks#new'
  resources :eligibility_checks, only: %i[new create] do
    get 'success', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
