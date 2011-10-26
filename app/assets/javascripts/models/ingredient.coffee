class Cookbook.Ingredient extends Backbone.Model
  url: ->
    @urlRoot = "/recipes/#{@get('recipe_id')}/ingredients"
    super