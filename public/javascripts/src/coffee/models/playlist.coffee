define [
  "jquery", 
  "backbone", 
  "collections/songs"
  ], ($, Backbone, SongsCollection) ->
  
  class PlaylistModel extends Backbone.Model

    idAttribute: "_id"
    
    initialize: ->
      @on "sync", @createSongsCollection, @
      @on "destroy:model", @removeSong, @

    validate: (attrs, options) ->
      if $.trim(attrs.title) is ""
        "You must enter a name for the playlist!"
        
    addSong: (song) ->
      @songs.create song
      
    createSongsCollection: ->
      @songs = new SongsCollection null, playlistID: @id
      @songs.on "all", @bubbleEvents, @
      
    bubbleEvents: (eventName) ->
      @trigger "#{eventName}:model"
      
    getLastSong: ->
      @songs.last()