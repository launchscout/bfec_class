class Cookbook.RecipesRouter extends Backbone.Router

  routes:
    "recipes/new": "newRecipe"
    "recipes/:id": "showRecipe"
    "recipes/:id/edit": "editRecipe"
    "recipes": "list"

  constructor: ->
    super
    @recipes = new Cookbook.Recipes
    @recipeView = new Cookbook.RecipeView(el: $("#recipe-view"))
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe-edit-view"))
    @recipeListView = new Cookbook.RecipeListView(el: $("#recipe-list-view"), collection: @recipes)

  list: ->
    @recipeListView.collection.fetch success: => @recipeListView.render()
    @recipeListView.collection.bind "persisted", => @recipeListView.render()

  showRecipe: (id) ->
    @recipeView.model = @recipes.get(id)
    @recipeEditView.el.hide()
    @recipeView.render()

  newRecipe: ->
    @recipeView.el.hide()
    newRecipe = new Cookbook.Recipe()
    newRecipe.bind "persisted", => 
      @recipes.add(newRecipe)
    @recipeEditView.model = newRecipe
    @recipeEditView.render()
    
  editRecipe: (id) ->
    @recipeEditView.model = @recipes.get(id)
    @recipeView.el.hide()
    @recipeEditView.render()
