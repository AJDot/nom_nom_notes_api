# frozen_string_literal: true

# Main mailer that all other mailers should inherit from
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
