# frozen_string_literal: true

require "administrate/base_dashboard"

class RecipeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    images: Field::ActiveStorage.with_options(
      destroy_url: proc do |_namespace, _resource, attachment|
        [:images_admin_recipe, { attachment_id: attachment.id }]
      end,
    ),
    ingredients: Field::NestedHasMany.with_options(
      skip: :recipe,
    ),
    category: Field::Select.with_options(searchable: false, collection: ->(field) {
                                                                          field.resource.class.send(field.attribute.to_s.pluralize).keys # .map(&:humanize)
                                                                        }),
    instructions: Field::NestedHasMany.with_options(
      skip: :recipe,
    ),
    name: Field::String,
    servings: Field::Number,
    prep_time: Field::String,
    cooking_tme: Field::String,
    instagram_embed: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :servings,
    :category,
    :prep_time,
    :cooking_time,
    :instagram_embed,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :servings,
    :prep_time,
    :cooking_time,
    :category,
    :images,
    :ingredients,
    :instructions,
    :instagram_embed,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :servings,
    :category,
    :images,
    :prep_time,
    :cooking_time,
    :instagram_embed,
    :ingredients,
    :instructions,
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how recipes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(recipe)
    recipe.name
  end

  def permitted_attributes
    super + [images: []]
  end
end
