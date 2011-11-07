class Cookbook.RecipeView extends Backbone.View

  events:
    "click #deleteRecipe": "delete"

  render: ->
    @el.html JST["recipe_view_template"] @
    @el.show()

  delete: ->
    @model.destroy(success: => @el.hide())