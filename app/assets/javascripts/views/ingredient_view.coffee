class Cookbook.IngredientView extends Backbone.View

  events:
    "click .display": "edit"
    "click #save": "save"

  edit: ->
    @$(".display").hide()
    @$(".edit").show()

  save: ->
    @model.save({description: @$("input[name=description]").val()}, success: => @render())

  render: ->
    @el.html JST["ingredient_view_template"] @
    @$(".edit").hide()
    @$(".display").show()
