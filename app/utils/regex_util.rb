# frozen_string_literal: true

module RegexUtil
  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  UUID = /\A\h{8}-\h{4}-\h{4}-\h{4}-\h{4}\h{8}\z/
end
