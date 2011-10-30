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
  recipeView = new Cookbook.RecipeView(el: el, model: {title:"Pancake", description:"I like pancakes!"})
  recipeView.render()
