#= require jquery
#= require_npm underscore
#= require_npm backbone
#= require_self
#= require_tree .
#= require_tree ../templates

@Cookbook = {}

# $(function() { });
# $(document).ready(function() {})

$ ->
  el = $("#recipe-view")
  recipe = new Cookbook.Recipe(id: 1)
  recipeView = new Cookbook.RecipeView(el: el, model: recipe)
  recipe.fetch(success: -> recipeView.render())

  el = $("#menu-view")
  menu = new Cookbook.Menu(id: 1)
  menuView = new Cookbook.MenuView(el: el, model: menu)
  menu.fetch(success: -> menuView.render())
