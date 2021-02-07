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

        resources :users, only: [:create]
        resources :recipes, only: [:create]
        resources :categories, only: [:create]
        resources :features, only: %i[create destroy]
      end
    end
  end
end
