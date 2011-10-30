describe "Recipe", ->
  beforeEach ->
    @recipe = new Cookbook.Recipe(title: "Pancake", description: "I like pancakes, do you like pancakes?")
  it "has a title", ->
    expect(@recipe.get('title')).toEqual("Pancake")
  it "has a description", ->
    expect(@recipe.get('description')).toMatch(/like/)

  describe "setters", ->
    beforeEach ->
      @recipe.set(title: "flapjacks")
    it "changes the attribute", ->
      expect(@recipe.get('title')).toEqual("flapjacks")

  describe "fetching", ->
    beforeEach ->
      @recipe = new Cookbook.Recipe(id: 2)
      @recipe.fetch()
      @request = mostRecentAjaxRequest()
    it "fetches from the recipe from the backend", ->
      expect(@request).toRequest
        method: "GET"
        url: "/recipes/2"
