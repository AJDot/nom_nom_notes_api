# frozen_string_literal: true

# Enable using uuid in postgresql
class EnableUuid < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end
