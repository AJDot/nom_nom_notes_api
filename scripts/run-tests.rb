#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Running tests'
status = system('bundle exec rspec')
raise StandardError, 'Rspec failed!' unless status
