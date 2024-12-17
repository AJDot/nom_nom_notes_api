# frozen_string_literal: true

module Api
  module V1
    # Controller to handle shopping list actions
    class ShoppingListsController < ApplicationController
      before_action :authenticate!
      before_action :build_shopping_list, only: [:create]
      before_action :set_shopping_list, only: %i[show update]
      authorize_resource only: %i[update]

      def index
        current_user.shopping_lists.create if current_user.shopping_lists.empty?
          
        @shopping_list = current_user.shopping_lists.first
        render json: @shopping_list, status: :ok
      end

      def create
        if @shopping_list.save
          render json: @shopping_list, status: :created
        else
          render json: { error: @shopping_list.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @shopping_list.update(shopping_list_params)
          render json: @shopping_list, status: :ok
        else
          render json: { error: @shopping_list.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def build_shopping_list
        @shopping_list = ShoppingList.new(shopping_list_params)
      end

      def set_shopping_list
        @shopping_list = ShoppingList.find_by(client_id: params[:id])
      end

      def shopping_list_params
        p = params.require(:shopping_list).permit(
          *ShoppingList.to_params,
        )

        ShoppingList.reflect_on_all_associations.each do |reflection|
          p["#{reflection.name}_attributes"] = p.delete(reflection.name) if p.key?(reflection.name)
        end

        p
      end
    end
  end
end
