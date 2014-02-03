define ['text!templates/pagination.html'], (template) ->
  class Forum.Views.PaginationView extends Backbone.Marionette.ItemView
    template: _.template(template)
    
    initialize: (options) ->
      @currentPage = parseInt options.currentPage
      @totalPages = Math.ceil(options.items/options.chunk)

    serializeData: ->
      data = super()
      data.currentPage = @currentPage
      data.totalPages = @totalPages
      data.pages = @_pagesArray()
      data

    _pagesArray: ->
      pages = []
      i = 1
      while(i <= @totalPages)
        pages.push(i)
        i++
      pages

    render: ->
      super() if @totalPages && @totalPages > 1

    templateHelpers:
      pageUrl: (page) ->
        "#/page-#{page}"
      
      nextPageUrl: ->
        @pageUrl(@currentPage + 1)
      
      prevPageUrl: ->
        @pageUrl(@currentPage - 1)

      currentPageClass: (page) ->
        if page == @currentPage then 'active' else ''

      prevPage: ->
        @currentPage != 1

      nextPage: ->
        @currentPage != @totalPages