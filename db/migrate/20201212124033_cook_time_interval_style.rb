# frozen_string_literal: true

# Set up interval style in postgres so interval types return iso_8601 style
class CookTimeIntervalStyle < ActiveRecord::Migration[6.0]
  def self.up
    execute "ALTER DATABASE \"#{connection.current_database}\" SET intervalstyle = 'iso_8601'"
  end

  def self.down
    execute "ALTER DATABASE \"#{connection.current_database}\" SET intervalstyle = 'postgres'"
  end
end
