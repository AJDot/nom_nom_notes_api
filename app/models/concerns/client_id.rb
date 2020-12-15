module ClientId
  extend ActiveSupport::Concern

  included do
    before_create :set_client_id

    def set_client_id
      self.client_id ||= SecureRandom.uuid
    end
  end
end
