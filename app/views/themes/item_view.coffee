define ['text!templates/themes/item.html'], (template) ->

  class Forum.Views.Themes.ItemView extends Backbone.Marionette.ItemView
    tagName: 'tr'
    template: _.template(template)

    ui:
      trash: 'span[role=trash]'
      edit: 'span[role=edit]'

    events:
      'click span[role=trash]' : '_deleteThemeAndMessages'

    _deleteThemeAndMessages: (e)->
      @.model.destroy()