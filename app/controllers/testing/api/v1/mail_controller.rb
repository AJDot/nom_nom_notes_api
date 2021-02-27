# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for handling passwords
      class MailController < ApplicationController
        def index
          render json: { mail: ActionMailer::Base.deliveries }, status: :ok
        end

        def link
          render json: {
            link: ActionMailer::Base.deliveries[params[:id].to_i - 1].html_part.body.match(%r{"(http://.+)"})[1],
          }, status: :ok
        end
      end
    end
  end
end
