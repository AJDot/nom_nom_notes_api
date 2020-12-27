require 'carrierwave'

class RecipeImageUploader < CarrierWave::Uploader::Base
  storage :fog unless Rails.env.test?

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
