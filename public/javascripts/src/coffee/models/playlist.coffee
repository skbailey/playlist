define [
  "jquery", 
  "backbone", 
  "collections/songs"
  ], ($, Backbone, SongsCollection) ->
  
  class PlaylistModel extends Backbone.Model

    idAttribute: "_id"
    
    initialize: ->
      @songs = new SongsCollection null, playlistID: @id
      @songs.on "all", @bubbleEvents, @
      
      # Build the songs url immediately if the ID is available otherwise wait until the
      # play list has been created on the server and an _id has been created in MongoDB
      unless @id
        @on "sync", @createSongsUrl, @
      @on "destroy:model", @removeSong, @

    validate: (attrs, options) ->
      if $.trim(attrs.title) is ""
        "You must enter a name for the playlist!"
        
    addSong: (song) ->
      @songs.add song
      
    addSongAndSave: (song) ->
      @songs.create song
      
    createSongsUrl: ->
      @songs.url = "/playlists/#{@id}/songs"
      
    bubbleEvents: (eventName) ->
      @trigger "#{eventName}:model"
      
    getLastSong: ->
      @songs.last()