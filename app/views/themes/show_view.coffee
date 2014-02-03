define ['text!templates/themes/show.html'], (template) ->

  class Forum.Views.Themes.ShowView extends Backbone.Marionette.ItemView
    template: _.template(template)