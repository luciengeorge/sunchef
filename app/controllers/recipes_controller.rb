# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!
  DURATION = 20 * 60 # 20 minutes

  def index
    @categories = Recipe.categories.map do |category, _|
      [category.humanize, category]
    end
    custom_filters = params.dig(:search, :custom_filters).compact_blank
    under_20_mins = custom_filters.include?("under_20_mins") if custom_filters.present?
    no_cooking_time = custom_filters.include?("no_cooking_time") if custom_filters.present?
    search_categories = params.dig(:search, :categories).compact_blank
    @checked = @categories.map do |category|
      search_categories.include?(category[1])
    end if search_categories.compact_blank.present?
    @pagy, @recipes = pagy(policy_scope(Recipe).order(created_at: :desc))
    @pagy, @recipes = pagy(@recipes.where(category: params[:category]).order(created_at: :desc)) if params.dig(
      :category,
    ).present?
    @pagy, @recipes = pagy(@recipes.search_by_name(params.dig(:search, :query)).order(created_at: :desc)) if params.dig(
      :search, :query
    ).present?
    if search_categories.present?
      @pagy, @recipes = pagy(@recipes.where(category: search_categories).order(created_at: :desc))
    end
    if under_20_mins.present? || no_cooking_time.present?
      @recipes = @recipes.select do |recipe|
        (ChronicDuration.parse(recipe.cooking_time) || 0) < DURATION
      end if under_20_mins.present?
      @recipes = @recipes.select do |recipe|
        (ChronicDuration.parse(recipe.cooking_time) || 0) == 0
      end if no_cooking_time.present?
      @pagy, @recipes = pagy(Recipe.where(id: @recipes.map(&:id)).order(created_at: :desc))
    end
  rescue Pagy::OverflowError
    redirect_to(recipes_path(page: 1, search: { query: params.dig(:search, :query) }))
  end

  def show
    @recipe = Recipe.find(params[:id].split("-").last)
    authorize(@recipe)
  end
end
