class RodauthController < ApplicationController
  # Used by Rodauth for rendering views, CSRF protection, running any
  # registered action callbacks and rescue handlers, instrumentation etc.

  # Controller callbacks and rescue handlers will run around Rodauth endpoints.
  # before_action :verify_captcha, only: :login, if: -> { request.post? }
  before_action :signup_enabled?, only: :create_account
  # after_action -> {head :created}
  rescue_from("Features::ForbiddenSignupError") { |exception| render json: { error: exception }, include: :report, status: :forbidden }
  # Layout can be changed for all Rodauth pages or only certain pages.
  # layout "authentication"
  # layout -> do
  #   case rodauth.current_route
  #   when :login, :create_account, :verify_account, :verify_account_resend,
  #        :reset_password, :reset_password_request
  #     "authentication"
  #   else
  #     "application"
  #   end
  # end

  private

  def signup_enabled?
    service = Features::Service.new
    raise service.error(:signup) unless service.enabled?(:signup)
  end
end
