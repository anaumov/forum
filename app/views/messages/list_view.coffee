class Forum.Views.Messages.ListView extends Backbone.Marionette.CollectionView
  itemView: Forum.Views.Messages.ItemView
  emptyView: Forum.Views.Messages.EmptyView
  className: 'messages-list'