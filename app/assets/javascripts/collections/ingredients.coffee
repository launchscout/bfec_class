#= require ../models/ingredient
class Cookbook.Ingredients extends Backbone.Collection

  constructor: (models, options)->
    super
    @recipe = options.recipe

  url: -> "/recipes/#{@recipe.get('id')}/ingredients"

  model: Cookbook.Ingredient