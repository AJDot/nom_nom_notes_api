# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting ShoppingLists
      class ShoppingListsController < ApplicationController
        def create
          shopping_lists_data = []
          shopping_lists_data << params[:shopping_list].permit! if params[:shopping_list].present?
          shopping_lists_data += params[:shopping_lists].map(&:permit!) if params[:shopping_lists].present?
          shopping_lists = ShoppingList.create(shopping_lists_data)
          render json: shopping_lists, status: shopping_lists.all?(&:valid?) ? :ok : :unprocessable_entity
        end
      end
    end
  end
end
