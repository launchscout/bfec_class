describe "RecipesRouter", ->
  beforeEach ->
    @router = new Cookbook.RecipesRouter
    clearAjaxRequests()
