# frozen_string_literal: true

if Rails.env.test?
  namespace :testing do
    namespace :api do
      namespace :v1 do
        resources :databases, only: [] do
          collection do
            post :clean
          end
        end

        resources :users, only: %i[create update]
        resources :recipes, only: [:create]
        resources :categories, only: [:create]
        resources :features, only: %i[create destroy]
        resource :password, controller: :passwords do
          collection do
            put :forgot
          end
        end
        resources :mail, only: [:index] do
          member do
            get :link
          end
        end
      end
    end
  end
end
