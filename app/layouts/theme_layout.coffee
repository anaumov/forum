define ['text!templates/layouts/theme_layout.html'], (template) ->

  class Forum.Layouts.ThemeLayout extends Marionette.Layout
    template: _.template(template)
    
    regions:
      themeHead: 'div[role=theme-head]'
      messages: 'div[role=theme-messages]'
      replayForm: 'div[role=message-form]'