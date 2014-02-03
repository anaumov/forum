define ['text!templates/layouts/main_layout.html'], (template) ->

  class Forum.Layouts.MainLayout extends Marionette.Layout
    template: _.template(template)
    
    regions:
      head: 'div[role=head]'
      content: 'div[role=content]'
      footer: 'div[role=footer]'