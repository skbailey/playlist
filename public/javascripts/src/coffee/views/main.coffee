define [
  "jquery", 
  "underscore", 
  "backbone",
  "collections/playlists",
  "views/playlist",
  "views/song"
  ], ($, _, Backbone, PlaylistCollection, PlaylistView, SongView) ->

  class MainView extends Backbone.View

    el: "#container"

    events:
      "submit #playlist-creator form" : "createPlaylist"

    initialize: ->
      @collection = new PlaylistCollection
      @collection.on "invalid", @showPlaylistSaveError, @
      @collection.on "sync", @loadPlaylists, @
      @collection.fetch()

    createPlaylist: (evt) ->
      evt.preventDefault();

      nameInput = $(evt.target).find('.name')
      @collection.create title: nameInput.val()
      nameInput.val("")

    loadPlaylists: ->
      @playlists ?= @$ "#playlists"
      @collection.forEach (model) =>
        @playlistView = new PlaylistView model: model
        @playlists.append @playlistView.render().el

    showPlaylistSaveError: (model, error) ->
      alert error
