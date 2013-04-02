define [
  "jquery", 
  "underscore", 
  "backbone",
  "collections/playlists",
  "views/playlist"
  ], ($, _, Backbone, PlaylistCollection, PlaylistView) ->

  class MainView extends Backbone.View

    el: "#container"

    events:
      "submit #playlist-creator form" : "createPlaylist"

    initialize: ->
      @collection = new PlaylistCollection
      @collection.on "invalid", @showPlaylistSaveError, @
      @collection.on "sync", @appendPlaylist, @
      @collection.on "reset", @loadPlaylists, @
      @collection.fetch()

    createPlaylist: (evt) ->
      evt.preventDefault();

      nameInput = $(evt.target).find('.name')
      @collection.create title: nameInput.val()
      nameInput.val("")

    appendPlaylist: ->
      @playlists ?= @$ "#playlists"
      @playlistView = new PlaylistView model: @collection.last()
      @playlists.append @playlistView.render().el

    showPlaylistSaveError: (model, error) ->
      alert error
      
    loadPlaylists: ->
      console.log "loading playlists", 
