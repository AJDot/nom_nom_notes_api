# frozen_string_literal: true

# Wrapper around 3rd party feature flag service (Flipper)
module FeatureService
  delegate_missing_to Flipper
  extend self
end
