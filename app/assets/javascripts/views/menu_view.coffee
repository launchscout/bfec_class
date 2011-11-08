class Cookbook.MenuView extends Backbone.View

  render: ->
    @el.html "<h1>#{@model.get('title')}</h1><p>#{@model.get('description')}</p>"