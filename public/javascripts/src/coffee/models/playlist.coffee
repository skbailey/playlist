define [
  "jquery", 
  "backbone", 
  "collections/songs"
  ], ($, Backbone, SongsCollection) ->
  
  class PlaylistModel extends Backbone.Model

    idAttribute: "_id"
    
    initialize: ->
      @on "sync", @createSongsCollection, @

    validate: (attrs, options) ->
      if $.trim(attrs.title) is ""
        "You must enter a name for the playlist!"
        
    addSong: (song) ->
      @songs.create song
      
    createSongsCollection: ->
      @songs = new SongsCollection null, playlistID: @id