describe "RecipeView", ->
  beforeEach ->
    setFixtures("<div id='recipe-view'></div>")
    @recipe = new Cookbook.Recipe title: "Pancakes", description: "I like pancakes, do you like pancakes?"
    @view = new Cookbook.RecipeView(el: $('#recipe-view'), model: @recipe)
    @view.render()
  it "displays the title", ->
    expect($('#recipe-view')).toHaveText(/Pancake/)
  it "displays the description", ->
    expect($('#recipe-view')).toHaveText(/like/)
