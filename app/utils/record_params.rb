# frozen_string_literal: true

# Construct graph of allowable action params
class RecordParams
  def initialize(*keys)
    @keys = keys
  end

  def to_params
    @keys
  end
end
