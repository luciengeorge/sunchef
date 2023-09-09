# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @categories = Recipe.categories.map do |category, _|
      [category.humanize, category]
    end
    @checked = @categories.map do |category|
      params.dig(:search, :categories).include?(category[1])
    end if params.dig(:search, :categories).present?
    @pagy, @recipes = pagy(policy_scope(Recipe).order(created_at: :desc))
    @pagy, @recipes = pagy(@recipes.where(category: params[:category]).order(created_at: :desc)) if params.dig(
      :category,
    ).present?
    @pagy, @recipes = pagy(@recipes.search_by_name(params.dig(:search, :query)).order(created_at: :desc)) if params.dig(
      :search, :query
    ).present?
    @pagy, @recipes = pagy(@recipes.where(category: params.dig(
      :search,
      :categories,
    ).compact_blank).order(created_at: :desc)) if params.dig(
      :search, :categories
    ).present?
  rescue Pagy::OverflowError
    redirect_to(recipes_path(page: 1, search: { query: params.dig(:search, :query) }))
  end

  def show
    @recipe = Recipe.find(params[:id].split("-").last)
    authorize(@recipe)
  end
end
