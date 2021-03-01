#!/usr/bin/env ruby
# frozen_string_literal: true

message_path = ARGV[0]
message = File.read message_path

COMMIT_REGEX = /^(revert: )?(feat|fix|docs|style|refactor|test|wip|chore)(\(.+\))?: .{1,50}/.freeze
MERGE_REGEX = /^Merge branch/.freeze # For Tower
spec_path = './docs/commit-conventions.md'
unless message.match(COMMIT_REGEX) || message.match(MERGE_REGEX)
  print <<~TEXT
    invalid commit message!

    Your message:
      #{message}

    does not meet the commit message conventions.
    Use the guidelines specified in
    #{spec_path}


    #{COMMIT_REGEX} || #{MERGE_REGEX}
    ☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠☠
    Example Commit Message:
  TEXT
  print <<~TEXT
    Header:   |  feat(cat-builder): Add New Layout Section
    (empty)   |
    Body:     |  Add workarea, config, and control panels
              |  Add basic drag and drop for initial elements
    (empty)   |
    Footer:   |  [ch101]
  TEXT
  exit 1
end
