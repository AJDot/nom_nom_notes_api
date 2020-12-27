class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :description, :cook_time, :note, :image
  has_many :steps, serializer: StepSerializer
  has_many :ingredients, serializer: IngredientSerializer
  has_many :categories, serializer: CategorySerializer
  has_many :recipe_categories, serializer: RecipeCategorySerializer
end
