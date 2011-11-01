$ ->
  window.router = new Cookbook.RecipesRouter
  Backbone.history.start()
  router.navigate("recipes/1", true)
