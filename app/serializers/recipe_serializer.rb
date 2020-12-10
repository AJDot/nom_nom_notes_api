class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cook_time, :note
end
