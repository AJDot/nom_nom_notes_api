# frozen_string_literal: true

# Adds draw method into Rails routing
# It allows us to keep routing split into files
module ActionDispatch
  module Routing
    # Extension for rails class
    class Mapper
      def draw(routes_name)
        instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
      end
    end
  end
end
