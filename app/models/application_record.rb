# frozen_string_literal: true

# Main record that all other records should inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.implicit_order_column = :created_at
  include ClientId
end
