# frozen_string_literal: true

# Type cast for converting between postgresql interval format and a ActiveSupport::Duration
class DurationType < ActiveRecord::Type::String
  def cast(value)
    if value.blank? || value.is_a?(ActiveSupport::Duration)
      value
    elsif value.is_a?(Integer)
      ActiveSupport::Duration.build(value).iso8601
    else
      ActiveSupport::Duration.parse(value)
    end
  end

  def serialize(duration)
    return unless duration

    case duration
    when String
      duration
    else
      duration.iso8601
    end
  end
end

ActiveRecord::Type.register(:duration, DurationType)
