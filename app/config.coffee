requirejs.config
  baseUrl: 'lib'
  paths:
    app: '../app'
    views: '../app/views'
    controllers: '../app/controllers'
    layouts: '../app/layouts'
    models: '../app/models'
    templates: '../app/templates'
  shim:
    'bootstrap/js/bootstrap.min': ['jquery-2.1.0.min']
    'backbone': ['underscore']
    'backbone.marionette.min': ['backbone.localStorage', 'backbone']

    'views/themes/index_view': ['views/themes/item_view', 'views/themes/empty_view']

    'views/messages/list_view': ['views/messages/item_view', 'views/messages/empty_view', 'views/messages/new_view']
    'layouts/theme_layout': ['views/themes/new_view', 'views/themes/show_view', 'views/messages/list_view']
    
    'views/themes/index_view': ['views/themes/item_view', 'views/themes/empty_view']
    'controllers/themes_controller': ['views/themes/index_view', 'layouts/theme_layout', 'models/theme', 'models/message', 'views/error_view']
    'app/router': ['controllers/themes_controller']


    'layouts/main_layout': ['app/settings', 'views/pagination_view']
    'app/start': ['app/router', 'layouts/main_layout']

requirejs ['backbone.marionette.min', 'bootstrap/js/bootstrap.min' ], ->
  requirejs ['app/start'], ->
    startForumApp()