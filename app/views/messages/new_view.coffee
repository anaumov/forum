define ['text!templates/messages/new.html'], (template) ->

  class Forum.Views.Messages.NewView extends Backbone.Marionette.ItemView
    template: _.template(template)

    ui:
      form: 'form'
      inputUser: 'input[name=username]'
      inputBody: 'textarea[name=body]'

    events:
      'click button' : '_createMessage'

    initialize: (options) ->
      @themeId = options.themeId

    _createMessage: (e) ->
      if @ui.form[0].checkValidity()
        e.preventDefault()
        @collection.create
          username: @ui.inputUser.val()
          body: @ui.inputBody.val()
          themeId: @themeId
        @_clearForm()

    _clearForm: ->
      @ui.inputUser.val('') 
      @ui.inputBody.val('')