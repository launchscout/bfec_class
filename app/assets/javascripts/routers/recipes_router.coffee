class Cookbook.RecipesRouter extends Backbone.Router

  routes:
    "recipes/:id": "showRecipe"

  constructor: ->
    super
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))

  showRecipe: (id)->
    @recipeView.model = new Cookbook.Recipe(id: id)
    @recipeView.model.fetch success: => @recipeView.render()