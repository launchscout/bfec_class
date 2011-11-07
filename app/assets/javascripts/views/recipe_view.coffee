class Cookbook.RecipeView extends Backbone.View

  events:
    "click #deleteRecipe": "delete"

  render: ->
    @el.html JST["recipe_view_template"] @
    @renderIngredients()
    @el.show()

  renderIngredients: ->
    @ingredientViews = for ingredient in @model.ingredients.models
      ingredientView = new Cookbook.IngredientView
        el: $("<li></li>").appendTo @$("#ingredients")
        model: ingredient
      ingredientView.render()
      ingredientView

  delete: ->
    @model.destroy(success: => @el.hide())