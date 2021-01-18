#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Running pre-commit hook'
status = system('./scripts/run-rubocop.rb')
raise StandardError, 'pre-commit checks failed!' unless status
