# frozen_string_literal: true

module Features
  # Wrapper around 3rd party feature flag service (Flipper)
  class Service < ActiveModelSerializers::Model
    include ActiveModel::Serialization
    delegate_missing_to Flipper

    # @param key [Symbol]
    def enabled?(key)
      is_enabled = Flipper.enabled?(key)
      add_report_item(key, error: new_error(key)) unless is_enabled
      is_enabled
    end

    def report
      { features: _report.features }
    end

    # @param key [Symbol]
    def error(key)
      report[:features][key]&.[](:error)
    end

    private

    def _report
      @report ||= Report.new
    end

    def add_report_item(key, error: nil)
      _report.add(key, error: error)
    end

    # @param key [:signup]
    def new_error(key)
      case key
      when :signup
        ForbiddenSignupError.new
      else
        ForbiddenError.new
      end
    end
  end

  # A Summary of the features gone through Service
  class Report < ActiveModelSerializers::Model
    include ActiveModel::Serialization

    def features
      @features ||= {}
    end

    def add(key, error: nil)
      features[key] = { error: error }
    end
  end

  # Base Feature error
  class Error < StandardError
    def initialize(msg = 'Feature error')
      super(msg)
    end
  end

  # Error for feature being off
  class ForbiddenError < Error
    def initialize(action: 'perform action')
      super(I18n.t('features.errors.forbidden.message', action: action))
    end
  end

  # Error for sign up feature being off
  class ForbiddenSignupError < ForbiddenError
    def initialize(action: nil)
      action ||= 'sign up'
      super
    end
  end
end
