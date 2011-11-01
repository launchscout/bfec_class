describe "RecipesRouter", ->
  beforeEach ->
    @router = new Cookbook.RecipesRouter
    clearAjaxRequests()

  describe "showRecipe", ->
    beforeEach ->
      spyOn(@router.recipeView, "render")
      @router.showRecipe(1)
      @request = mostRecentAjaxRequest()
      @request.response
        status: 200
    it "renders the RecipeView", ->
      expect(@router.recipeView.render).toHaveBeenCalled()

    it "fetches the model by id", ->
      expect(@request).toRequest
        method: "GET"
        url: "/recipes/1"