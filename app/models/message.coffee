class Forum.Models.Message extends Backbone.Model

class Forum.Collections.MessagesCollection extends Backbone.Collection
  model: Forum.Models.Message
  localStorage: new Backbone.LocalStorage("MessagesCollection")

  fetchByTheme: (themeId, successCb) ->
    @fetch
      success: =>        
        successCb new Forum.Collections.MessagesCollection(@.where({themeId: themeId}))