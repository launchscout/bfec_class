class Cookbook.RecipesRouter extends Backbone.Router

  routes:
    "recipes/:id": "showRecipe"
    "recipes/:id/edit": "editRecipe"

  constructor: ->
    super
    @recipes = new Cookbook.Recipes
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe-edit-view"))
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe-list-view"), collection: @recipes)

  listRecipes: ->
    @recipeListView.collection.fetch success: => @recipeListView.render()
    @recipeListView.collection.bind "persisted", => @recipeListView.render()

  showRecipe: (id) ->
    @recipeView.model = @recipes.get(id)
    @recipeEditView.el.hide()
    @recipeView.render()

  editRecipe: (id) ->
    @recipeEditView.model = @recipes.get(id)
    @recipeView.el.hide()
    @recipeEditView.render()
