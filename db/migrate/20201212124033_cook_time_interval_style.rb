# typed: false
class CookTimeIntervalStyle < ActiveRecord::Migration[6.0]
  def self.up
    execute "ALTER DATABASE \"#{connection.current_database}\" SET intervalstyle = 'iso_8601'"
  end

  def self.down
    execute "ALTER DATABASE \"#{connection.current_database}\" SET intervalstyle = 'postgres'"
  end
end
