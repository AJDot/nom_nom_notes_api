# frozen_string_literal: true

# Mixin to make records function with client_id
module ClientId
  extend ActiveSupport::Concern

  class << self
    def build_client_id
      SecureRandom.uuid
    end
  end

  included do
    # Doesn't work for User class because Rodauth handles user creation
    # @see RodauthMain class
    before_create :set_client_id
  end

  def set_client_id
    self.client_id ||= ClientId.build_client_id
  end
end
