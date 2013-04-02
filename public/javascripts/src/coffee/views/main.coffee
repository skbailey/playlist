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
      "click .create-playlist" : "showCreatePlaylistForm"
      "submit #playlist-creator form" : "createPlaylist"

    initialize: ->
      @collection = new PlaylistCollection
      @collection.on "invalid", @showPlaylistSaveError, @
      @collection.on "sync", @appendPlaylist, @

    showCreatePlaylistForm: (evt) ->
      @createPlaylistForm ?= @$("#playlist-creator form")
      @createPlaylistForm.addClass("show")

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
