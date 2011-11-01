class Cookbook.RecipeView extends Backbone.View

  render: ->
    @el.html JST["recipe_view_template"] @
    @el.show()
