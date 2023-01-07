# frozen_string_literal: true

require 'carrierwave'
require 'carrierwave/orm/activerecord'

if Rails.env.test?# || Rails.env.development?
  Fog.mock! if Rails.application.credentials.fog_mock == 'true'
  CarrierWave.configure do |config|
    config.storage = :file
    # config.root = Rails.root.join('/tmp') # default is "Rails.root.join('/public')"
  end
else
  require 'carrierwave/storage/fog'
  require 'fog/aws'
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws_access_key_id,
      aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
      region: Rails.application.credentials.aws_region,
    }
    config.fog_directory = Rails.application.credentials.s3_bucket_name
    config.fog_public = false
    config.fog_attributes = {
      cache_control: "public, max-age=#{365.days.to_i}",
    }
  end
end
