# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @recipes = policy_scope(Recipe)
    @recipes = @recipes.where(category: params[:category]) if params[:category].present?
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize(@recipe)
  end
end
