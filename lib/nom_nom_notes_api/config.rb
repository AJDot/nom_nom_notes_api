# frozen_string_literal: true

require 'nom_nom_notes_api/admin_auth'

module NomNomNotesApi
  # Common place for application configurations
  module Config
    module_function

    def use_admin_auth(middleware)
      middleware.use NomNomNotesApi::AdminAuth do |username, password|
        [username, password] == [ENV.fetch('ADMIN_USERNAME'), ENV.fetch('ADMIN_SECRET')]
      end
    end
  end
end
