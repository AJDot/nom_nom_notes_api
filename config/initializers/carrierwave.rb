# frozen_string_literal: true

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/fog'
require 'fog/aws'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Figaro.env.AWS_ACCESS_KEY_ID,
    aws_secret_access_key: Figaro.env.AWS_SECRET_ACCESS_KEY,
    region: 'us-east-1',

  }
  config.fog_directory = Figaro.env.S3_BUCKET_NAME
  config.fog_public = false
  config.fog_attributes = {
    cache_control: "public, max-age=#{365.days.to_i}",
  }
end
