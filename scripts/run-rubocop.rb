#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Running rubocop'
status = system('bundle exec rubocop')
raise StandardError, 'Rubocop fail fail!' unless status
