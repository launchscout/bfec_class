class Cookbook.RecipesRouter extends Backbone.Router

  routes:
    "recipes/:id": "showRecipe"

  constructor: ->
    super
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe-list-view"))
    @recipeListView.collection = new Cookbook.Recipes

  list: ->
    @recipeListView.collection.fetch success: => @recipeListView.render()

  showRecipe: (id)->
    @recipeView.model = new Cookbook.Recipe(id: id)
    @recipeView.model.fetch success: => @recipeView.render()