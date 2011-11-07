describe "RecipeView", ->
  beforeEach ->
    setFixtures("<div id='recipe-view'></div>")
    @recipe = new Cookbook.Recipe title: "Pancakes", description: "I like pancakes, do you like pancakes?"
    @view = new Cookbook.RecipeView(el: $('#recipe-view'), model: @recipe)
    @view.render()
  it "displays the title", ->
    expect($('#recipe-view')).toHaveText(/pancake/)
  it "displays the description", ->
    expect($('#recipe-view')).toHaveText(/like/)

  describe "deleting", ->
    beforeEach ->
      @view.model.set(id: "1")
      @view.delete()
      @request = mostRecentAjaxRequest()
      @request.response
        status: 200
    it "DELETEs to the backend", ->
      expect(@request).toRequest
        method: "DELETE"
        url: "/recipes/1"
    it "hides the view", ->
      expect(@view.el).toBeHidden()

  describe "ingredients", ->
    beforeEach ->
      @ingredient = new Cookbook.Ingredient(description: "1 cup goo")
      @recipe.ingredients = new Cookbook.Ingredients([@ingredient], recipe: @recipe)
      @view.render()
    it "puts the ingredients in a list", ->
      expect(@view.$("ul li:first").html()).toMatch(/goo/)