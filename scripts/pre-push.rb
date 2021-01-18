#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Running pre-push hook'
status = system('./scripts/run-tests.rb')
raise StandardError, 'pre-push checks failed!' unless status
