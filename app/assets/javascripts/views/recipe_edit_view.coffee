class Cookbook.RecipeEditView extends Backbone.View

  render: ->
    @el.html JST["recipe_edit_view_template"] @
    @el.show()

  events:
    "click input[value=Save]": "save"

  save: (event)->
    event.preventDefault()
    @model.save {
        title: @$("input[name=title]").val()
        description: @$("textarea[name=description]").val()
      },
      success: => @close()
      error: (model, response) => @displayErrors(response)
  
  displayErrors: (response) ->
    errors = JSON.parse(response.responseText)
    @displayError(field, messages) for field, messages of errors
    
  displayError: (field, messages) ->
    fieldInput = @$("input[name=#{field}]")
    fieldInput.parent().parent().addClass("error")
    fieldInput.after("<span class='help-inline'>#{messages[0]}</span>")
      
  close: ->
    @el.hide()
    window.router.navigate "recipes/#{@model.id}", true
