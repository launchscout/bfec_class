class Cookbook.IngredientView extends Backbone.View

  render: ->
    @el.html JST["ingredient_view_template"] @