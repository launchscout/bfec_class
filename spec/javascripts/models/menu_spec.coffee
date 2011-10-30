describe "Menu", ->
  beforeEach ->
    @menu = new Cookbook.Menu(title: "Breakfast", description: "The most important meal of the day")
  it "has a title", ->
    expect(@menu.get('title')).toEqual("Breakfast")
  it "has a description", ->
    expect(@menu.get('description')).toMatch(/important/)
