# frozen_string_literal: true

# Main mailer that all other mailers should inherit from
class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  default from: ActionMailer::Base.default_url_options[:sender_from]
  layout 'mailer'
  prepend_view_path 'app/views/mailers'
end
