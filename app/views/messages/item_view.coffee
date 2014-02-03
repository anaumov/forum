define ['text!templates/messages/item.html'], (template) ->

  class Forum.Views.Messages.ItemView extends Backbone.Marionette.ItemView
    template: _.template(template)

    ui:
      trash: 'span[role=trash]'

    events:
      'click span[role=trash]' : '_deleteMessage'

    _deleteMessage: (e)->
      @.model.destroy()