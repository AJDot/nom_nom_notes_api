# frozen_string_literal: true

module Api
  module V1
    # Mail about passwords, forgotten, reset
    class PasswordMailer < ApplicationMailer
      def forgot(email:, token:, origin_url:)
        @origin_url = origin_url
        @recipient = OpenStruct.new(email: email)
        @heading = 'Password Reset Requested'
        @url = "#{origin_url}?#{{ token: token }.to_query}"
        mail to: @recipient.email, subject: @heading
      end
    end
  end
end
