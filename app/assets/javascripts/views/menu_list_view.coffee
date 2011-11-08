class Cookbook.MenuListView extends Backbone.View

  render: ->
    @el.html JST["menu_list_view_template"] @
