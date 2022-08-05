# frozen_string_literal: true

require 'nom_nom_notes_api/admin_auth'

module NomNomNotesApi
  # Common place for application configurations
  module Config
    module_function

    def use_admin_auth(middleware)
      middleware.use NomNomNotesApi::AdminAuth do |username, password|
        [username, password] == [
          Rails.application.credentials.admin_username,
          Rails.application.credentials.admin_secret,
        ]
      end
    end
  end
end
