define [
  "jquery", 
  "underscore", 
  "backbone",
  "collections/playlists"
  ], ($, _, Backbone, PlaylistCollection) ->

  class MainView extends Backbone.View

    el: "#container"

    events:
      "click .create-playlist" : "showCreatePlaylistForm"
      "submit #playlist-creator form" : "createPlaylist"

    initialize: ->
      @collection = new PlaylistCollection
      @collection.on "invalid", @showPlaylistSaveError, @

    showCreatePlaylistForm: (evt) ->
      @createPlaylistForm ?= @$("#playlist-creator form")
      @createPlaylistForm.addClass("show")

    createPlaylist: (evt) ->
      evt.preventDefault();

      input = $(evt.target).find('input')
      @collection.create title: input.val()

    showPlaylistSaveError: (model, error) ->
      alert error
