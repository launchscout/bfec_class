describe "RecipeListView", ->
  beforeEach ->
    @collection = new Cookbook.Recipes [
      {id: 1, title: "pancakes", description: "I like pancakes"}
      {id: 2, title: "flapjacks", description: "A worthy substitute for pancakes"}
      {id: 3, title: "potato cakes", description: "Deliciously fried"}
    ]
    setFixtures("<div id='recipe-list-view'></div>")
    @listView = new Cookbook.RecipeListView(el: $('#recipe-list-view'), collection: @collection)

  describe "render", ->
    beforeEach ->
      @listView.render()
    it "displays a list item for each recipe", ->
      expect($('#recipe-list-view ul li').size()).toEqual(3)
    it "links to show each recipe", ->
      expect($("a[href='#recipes/1']")).toExist()