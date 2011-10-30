class Cookbook.MenuView extends Backbone.View

  render: ->
    @el.html "<h1>#{@model.title}</h1><p>#{@model.description}</p>"