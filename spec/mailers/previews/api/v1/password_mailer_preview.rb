# frozen_string_literal: true

module Api
  module V1
    # Preview all emails at http://localhost:3000/rails/mailers/password_mailer
    class PasswordMailerPreview < ActionMailer::Preview
      def forgot
        Api::V1::PasswordMailer.forgot(
          email: 'philip.fry@planet-express.com',
          token: 'Ta123456',
          origin_url: 'localhost:8080/password/reset',
        )
      end
    end
  end
end
