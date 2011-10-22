class Cookbook.RecipeEditView extends Backbone.View

  render: ->
    @el.html JST["recipe_edit_view_template"] @
