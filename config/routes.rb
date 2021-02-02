# frozen_string_literal: true

Rails.application.routes.draw do
  draw 'api/v1/testing'

  concern :api_base do
    resource :current_user, controller: :current_user, only: %i[show]
    resources :recipes, only: %i[index show update create destroy]
    resources :categories, only: [:index]
    mount Flipper::Api.app(Flipper) => '/flipper/api'
  end

  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
