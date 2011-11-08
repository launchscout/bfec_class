#= require ../models/menu
class Cookbook.Menus extends Backbone.Collection
  model: Cookbook.Menu
  url: "/menus"