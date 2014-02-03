startForumApp = ->
  window.Forum = Forum

  App = new Backbone.Marionette.Application()
  Forum.mainLayout = new Forum.Layouts.MainLayout()
  Forum.router = new Forum.Router()

  App.on "initialize:before", ->
    Forum.mainLayout.render()
    $('.container').html Forum.mainLayout.$el

  App.addInitializer -> 
    Backbone.history.start()

  App.start()