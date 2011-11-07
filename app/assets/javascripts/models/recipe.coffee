class Cookbook.Recipe extends Backbone.Model
  urlRoot: "/recipes"

  constructor: ->
    super
    @ingredients = new Cookbook.Ingredients([], recipe: @)

  save: (args, options)->
    options or= {}
    success = options.success
    options.success = =>
      @trigger("persisted")
      success() if success?
    super(args, options)
