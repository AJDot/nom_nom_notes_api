#!/usr/bin/env ruby
# frozen_string_literal: true

status = system('bundle exec rspec')
raise StandardError, 'Rspec failed!' unless status
