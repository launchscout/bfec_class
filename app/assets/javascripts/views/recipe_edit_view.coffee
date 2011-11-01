class Cookbook.RecipeEditView extends Backbone.View

  render: ->
    @el.html JST["recipe_edit_view_template"] @

  events:
    "click input[value=Save]": "save"

  save: (event)->
    event.preventDefault()
    @model.save {
        title: @$("input[name=title]").val()
        description: @$("textarea[name=description]").val()
      },
      success: => @close()

  close: ->
    @el.hide()
    window.router.navigate "recipes/#{@model.id}", true
