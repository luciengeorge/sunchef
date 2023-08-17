# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pagy, @recipes = pagy(policy_scope(Recipe))
    @pagy, @recipes = pagy(@recipes.where(category: params[:category])) if params[:category].present?
    @pagy, @recipes = pagy(@recipes.search_by_name(params.dig(:search, :query))) if params.dig(:search, :query).present?
  rescue Pagy::OverflowError
    redirect_to(recipes_path(page: 1, search: { query: params.dig(:search, :query) }))
  end

  def show
    @recipe = Recipe.find(params[:id].split("-").last)
    authorize(@recipe)
  end
end
