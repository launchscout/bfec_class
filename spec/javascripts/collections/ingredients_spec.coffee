describe "Ingredients Collection", ->
  beforeEach ->
    @recipe = new Cookbook.Recipe(id: 1)
    @ingredients = new Cookbook.Ingredients([], recipe: @recipe)

  describe "fetching", ->
    beforeEach ->
      @ingredients.fetch()
      @request = mostRecentAjaxRequest()
    it "GETs on the nested ingredients index", ->
      expect(@request).toRequest
        method: "GET"
        url: "/recipes/1/ingredients"