class Forum.Views.Themes.IndexView extends Backbone.Marionette.CollectionView
  itemView: Forum.Views.Themes.ItemView
  emptyView: Forum.Views.Themes.EmptyView
  tagName: 'table'
  className: 'table table-hover'
