$ ->
  Cookbook.Ready()

Cookbook.Ready = ->
  window.router = new Cookbook[routerName]
  Backbone.history.start()
  router.list()
