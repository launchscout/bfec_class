describe "MenuListView", ->
  beforeEach ->
    @collection = new Cookbook.Menus [
      {id: 1, title: "breakfast", description: "The most important meal of the day"}
      {id: 2, title: "lunch", description: "Only slightly less important than breakfast"}
      {id: 3, title: "dinner", description: "Nobody really cares about this"}
    ]
    setFixtures("<div id='menu-list-view'></div>")
    @listView = new Cookbook.MenuListView(el: $('#menu-list-view'), collection: @collection)

  describe "render", ->
    beforeEach ->
      @listView.render()
    it "displays a list item for each menu", ->
      expect($('#menu-list-view ul li').size()).toEqual(3)
    it "links to show each menu", ->
      expect($("a[href='#menus/1']")).toExist()