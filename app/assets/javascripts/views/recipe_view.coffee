class Cookbook.RecipeView extends Backbone.View

  render: ->
    @el.html "<h2>#{@model.get('title')}</h2>"
    @$("h2").after "<p>#{@model.get('description')}</p>"
