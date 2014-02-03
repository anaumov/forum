class Forum.Controllers.ThemesController extends Marionette.Controller
  #spinner!

  initialize: ->
    @mainLayout = window.Forum.mainLayout
    @themeLayout = new Forum.Layouts.ThemeLayout
    
    @themesCollection = new Forum.Collections.ThemesCollection
    @messagesCollection = new Forum.Collections.MessagesCollection
    
  index: (page=1) ->
    itemsOnPage = 5
    @mainLayout.head.show new Forum.Views.Themes.NewView(collection: @themesCollection)
    
    @_fetchThemes =>
      totalThemes = @themesCollection.length
      @mainLayout.content.show new Forum.Views.Themes.IndexView(collection: @_currentPageCollection(page, itemsOnPage))
      @mainLayout.footer.show new Forum.Views.PaginationView(currentPage: page, items: totalThemes, chunk: itemsOnPage)
    
  theme: (themeId) ->
    @mainLayout.head.close()
    @mainLayout.footer.close()
    @mainLayout.content.show @themeLayout

    @_fetchThemes =>
        theme = @themesCollection.findWhere id: themeId
        @themeLayout.themeHead.show new Forum.Views.Themes.ShowView(model: theme)
        @_renderThemeMessages(themeId)
    
  _renderThemeMessages: (themeId) ->
    @messagesCollection.fetchByTheme themeId, ((collection) =>
      @themeLayout.messages.show new Forum.Views.Messages.ListView(collection: collection)
      @themeLayout.replayForm.show new Forum.Views.Messages.NewView(collection: collection, themeId: themeId)
      )

  _currentPageCollection: (page, chunk)=>
    offset = (page - 1) * chunk
    @themesCollection.reset @themesCollection.slice(offset, offset + chunk)
    @themesCollection

  _fetchThemes: (callback) ->
    @themesCollection.fetch
      success: => callback()
      error: =>
        @mainLayout.content.show new Forum.Views.ErrorView(message: 'Somthing went wrong during fetching data from server.')