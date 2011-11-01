class Cookbook.RecipesRouter extends Backbone.Router

  constructor: ->
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))

  showRecipe: (id)->
    @recipeView.model = new Cookbook.Recipe(id: id)
    @recipeView.model.fetch success: => @recipeView.render()