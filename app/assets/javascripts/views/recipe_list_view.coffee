class Cookbook.RecipeListView extends Backbone.View

  render: ->
    @el.html JST["recipe_list_view_template"] @
