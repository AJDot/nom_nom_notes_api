# frozen_string_literal: true

# JSON Serializer for User class
class UserSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :username, :first_name, :last_name, :email
end
