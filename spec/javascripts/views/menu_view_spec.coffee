describe "MenuView", ->
  beforeEach ->
    setFixtures("<div id='menu-view'></div>")
    @menu = {title: "Breakfast", description: "The most important meal of the day"}
    @view = new Cookbook.MenuView(el: $('#menu-view'), model: @menu)
    @view.render()
  it "displays the title", ->
    expect($('#menu-view')).toHaveText(/Breakfast/)
  it "displays the description", ->
    expect($('#menu-view')).toHaveText(/important/)
