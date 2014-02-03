define ['text!templates/themes/new.html'], (template) ->
  
  class Forum.Views.Themes.NewView extends Backbone.Marionette.ItemView
    template: _.template(template)

    ui:
      form: 'form'
      inputTitle: 'input[name=title]'
      inputDesc: 'textarea[name=description]'
      toggleButton: 'button[role=toggle-form]'

    events:
      'click button[role=submit-form]' : '_createTheme'
      'click @ui.toggleButton' : '_toggleForm'

    _createTheme: (e) ->
      if @ui.form[0].checkValidity()
        e.preventDefault()
        @collection.create {title: @ui.inputTitle.val(), description: @ui.inputDesc.val()}, wait: true
        @_clearAndCloseForm()

    _toggleForm: (e) ->
      if e
        e.preventDefault()
        e.stopPropagation()
      @ui.form.toggleClass('hidden')
      @ui.toggleButton.toggleClass('btn-success')
      @ui.toggleButton.toggleClass('btn-default')

    _clearAndCloseForm: ->
      @ui.inputTitle.val('') 
      @ui.inputDesc.val('')
      @_toggleForm()