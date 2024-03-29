# frozen_string_literal: true

# Ability guardian
# use #as_json to create an object of configs ready to send to the UI
class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can %i[update destroy], Recipe, { owner_id: user.client_id }
      can %i[update destroy], DynamicRecipe, { owner_id: user.client_id }
      can %i[index update], ShoppingList, { owner_id: user.client_id }
    end
  end

  def as_json(_opts)
    rules.map do |rule|
      object = { action: rule.actions, subject: rule.subjects.map { |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions if rule.conditions.present?
      object[:inverted] = true unless rule.base_behavior
      object.deep_transform_keys { |k| k.to_s.camelize(:lower) }
    end
  end
end
