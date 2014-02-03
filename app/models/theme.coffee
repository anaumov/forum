class Forum.Models.Theme extends Backbone.Model

class Forum.Collections.ThemesCollection extends Backbone.Collection
  model: Forum.Models.Theme
  localStorage: new Backbone.LocalStorage("ThemesCollection")