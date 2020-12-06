Rails.application.routes.draw do
  concern :api_base do
    resources :recipes, only: [:index, :show, :update]
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
