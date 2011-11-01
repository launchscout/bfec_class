#= require ../models/recipe
class Cookbook.Recipes extends Backbone.Collection
  model: Cookbook.Recipe
  url: "/recipes"