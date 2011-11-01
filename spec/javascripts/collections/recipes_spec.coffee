describe "Recipes", ->
  beforeEach ->
    @recipes = new Cookbook.Recipes()

  describe "fetching", ->
    beforeEach ->
      @recipes.fetch()
      @request = mostRecentAjaxRequest()
      @attributes = {title: "Food", description: "Cook it"}
      @request.response
        status: 200
        responseText: JSON.stringify [@attributes]
    it "fetches from the recipe from the backend", ->
      expect(@request).toRequest
        method: "GET"
        url: "/recipes"
    it "receives a recipe", ->
      expect(@recipes.models.length).toEqual 1
    it "instantiates a Recipe model", ->
      # Doesn't get the "typeof" correctly in IE, but so what?
      expect(@recipes.models[0].constructor.name).toEqual("Recipe")
