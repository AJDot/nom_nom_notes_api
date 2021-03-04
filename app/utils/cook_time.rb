# frozen_string_literal: true

# Small helper class to handle transformations of postgresql interval to something usable
class CookTime
  attr_reader :interval, :hours, :minutes

  def initialize(interval)
    interval = '00:00' if interval.blank?
    # strip off seconds and leading zeros
    # turn into HH:MM format (hours may be > 99)
    hh_mm = /\A0*(\d*):0*(\d*)/
    match = interval.match(hh_mm)
    @interval, @hours, @minutes = match ? match[0..2] : %w[00:00 0 0]
    @hours = '0' if hours.empty?
    @minutes = '0' if minutes.empty?
  end

  def to_s
    @interval
  end

  def ==(other)
    return nil unless [String, CookTime].include? other.class

    if other.instance_of? String
      interval == other
    elsif other.instance_of? CookTime
      interval == other.interval
    end
  end

  def blank?
    non_zero = /[1-9]+/
    !hours.match?(non_zero) && !minutes.match(non_zero)
  end
end
