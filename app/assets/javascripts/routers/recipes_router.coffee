class Cookbook.RecipesRouter extends Backbone.Router

  routes:
    "recipes/:id": "showRecipe"
    "recipes/:id/edit": "editRecipe"

  constructor: ->
    super
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe-edit-view"))
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe-list-view"))
    @recipeListView.collection = new Cookbook.Recipes

  listRecipes: ->
    @recipeListView.collection.fetch success: => @recipeListView.render()

  showRecipe: (id) ->
    @recipeView.model = new Cookbook.Recipe(id: id)
    @recipeView.model.fetch success: => @recipeView.render()

  editRecipe: (id) ->
    @recipeEditView.model = new Cookbook.Recipe(id: id)
    @recipeEditView.model.fetch success: =>
      @recipeView.el.hide()
      @recipeEditView.render()
