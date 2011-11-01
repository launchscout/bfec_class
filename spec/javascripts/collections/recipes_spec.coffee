describe "Recipes", ->
  beforeEach ->
    @recipes = new Cookbook.Recipes()

  describe "fetching", ->
    beforeEach ->
      @recipes.fetch()
      @request = mostRecentAjaxRequest()
    it "fetches from the recipe from the backend", ->
      expect(@request).toRequest
        method: "GET"
        url: "/recipes"
