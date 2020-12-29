# typed: strict
class RecipeCategorySerializer < ActiveModel::Serializer
  attributes :id, :client_id, :recipe_id, :category_id
end
