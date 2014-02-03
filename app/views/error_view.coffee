define ['text!templates/error.html'], (template) ->
  class Forum.Views.ErrorView extends Backbone.Marionette.ItemView
    className: 'alert alert-danger fade in'
    template: _.template(template)
    
    onRender: ->
      $(".alert").alert()

    serializeData: ->
      data = super()
      data.message = @options.message
      data