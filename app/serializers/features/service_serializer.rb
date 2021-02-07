# frozen_string_literal: true

module Features
  # JSON Serializer
  class ServiceSerializer < ActiveModel::Serializer
    attributes :report
  end
end
