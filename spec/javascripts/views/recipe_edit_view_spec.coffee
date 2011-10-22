describe "EditRecipeSpec", ->
  beforeEach ->
    setFixtures("<div id='recipe_edit_view'></div>")
    @recipe = new Cookbook.Recipe(title: "Food", description: "It is delicious.")
    @recipeEditView = new Cookbook.RecipeEditView(el: $("#recipe_edit_view"), model: @recipe)
    @recipeEditView.render()
  it "should have inputs", ->
    expect(@recipeEditView.$("input[name=title]").val()).toEqual @recipe.get("title")
    expect(@recipeEditView.$("textarea[name=description]").val()).toEqual @recipe.get("description")
