class Cookbook.RecipeView extends Backbone.View

  events:
    "click #deleteRecipe": "delete"
    "click #newIngredient": "newIngredient"

  render: ->
    @el.html JST["recipe_view_template"] @
    @renderIngredients()
    @el.show()

  renderIngredients: ->
    @ingredientViews = (@addIngredientView(ingredient) for ingredient in @model.ingredients.models)

  delete: ->
    @model.destroy(success: => @el.hide())

  addIngredientView: (ingredient) ->
    ingredientView = new Cookbook.IngredientView
      el: $("<li></li>").appendTo @$("#ingredients")
      model: ingredient
    ingredientView.render()
    ingredientView

  newIngredient: ->
    view = @addIngredientView(new Cookbook.Ingredient(recipe_id: @model.id))
    view.edit()
    @ingredientViews.push(view)
