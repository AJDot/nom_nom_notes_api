# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Recipes
      class DatabasesController < ApplicationController
        def clean
          DatabaseCleaner.strategy = :truncation
          DatabaseCleaner.clean
          ActionMailer::Base.deliveries = []
          Rails.application.load_seed
        end
      end
    end
  end
end
