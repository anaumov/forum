class Forum.Router extends Backbone.Marionette.AppRouter
  initialize: ->
    @controller = new Forum.Controllers.ThemesController()

  appRoutes:
    '': 'index'
    'page-:page': 'index'
    'themes/:id' : 'theme'