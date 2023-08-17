# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @recipes = pagy(policy_scope(Recipe))
    @pagy, @recipes = pagy(@recipes.where(category: params[:category])) if params[:category].present?
  rescue Pagy::OverflowError
    redirect_to(recipes_path(page: 1))
  end

  def show
    @recipe = Recipe.find(params[:id].split("-").last)
    authorize(@recipe)
  end
end
