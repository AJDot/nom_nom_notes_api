# frozen_string_literal: true

ActiveModel::Serializer.config.adapter = ActiveModelSerializers::Adapter::JsonApi
ActiveModel::Serializer.config.key_transform = :camel_lower
