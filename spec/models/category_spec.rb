# frozen_string_literal: true

require 'rails_helper'
require_relative 'concerns/client_id_spec'

RSpec.describe Category, type: :model do
  it_behaves_like 'client_id'
end
