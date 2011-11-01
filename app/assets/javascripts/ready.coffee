$ ->
  window.router = new Cookbook.RecipesRouter
  Backbone.history.start()
  router.listRecipes()