describe "EditRecipeSpec", ->
  beforeEach ->
    setFixtures("<div id='recipe_edit_view'></div>")
    @recipe = new Cookbook.Recipe(title: "Food", description: "It is delicious.", id: 1)
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe_edit_view"), model: @recipe)
    @recipeEditView.render()
  it "should have inputs", ->
    expect(@recipeEditView.$("input[name=title]").val()).toEqual @recipe.get("title")
    expect(@recipeEditView.$("textarea[name=description]").val()).toEqual @recipe.get("description")

  describe "saving", ->
    beforeEach ->
      spyOn(window.router, "navigate")
      @recipeEditView.render()
      @recipeEditView.$("input[name=title]").val("the new title")
      @recipeEditView.$("textarea[name=description]").val("the new description")
      @recipeEditView.save(new jQuery.Event)

    describe "successfully", ->
      beforeEach ->
        @request = mostRecentAjaxRequest()
        @request.response
          status: 200
      it "should update the model", ->
        expect(@recipe.get("title")).toEqual "the new title"
        expect(@recipe.get("description")).toEqual "the new description"
      it "posts to the backend", ->
        expect(@request).toRequest
          method: "PUT"
          url: "/recipes/1"
      it "navigates to the show recipe view on success", ->
        expect(window.router.navigate).toHaveBeenCalled()

    describe "with errors", ->
      beforeEach ->
        @request = mostRecentAjaxRequest()
        @request.response
          status: 422
          responseText: JSON.stringify(title: ["can't be blank"])
      it "sets an error class on the clearfix div", ->
        expect(@recipeEditView.$("div.clearfix:first")).toHaveClass "error"
      it "should display the error message as inline help", ->
        expect(@recipeEditView.$("span.help-inline").html()).toMatch /can.t be blank/
