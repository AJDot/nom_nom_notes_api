# frozen_string_literal: true

# Carrierwave uploader for the image for a recipe
class RecipeImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
