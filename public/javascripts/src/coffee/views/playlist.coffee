define [
  "jquery", 
  "backbone", 
  "templates/playlist",
  "models/song",
  "views/song"
  ], ($, Backbone, playlistTemplate, SongModel, SongView) ->

  class PlaylistView extends Backbone.View

    tagName: "li"
    events:
      "click .remove-playlist" : "delete"
      "click .icon-edit" : "edit"
      "click .icon-plus" : "showAddSongsForm"
      "click .song-creator .icon-remove" : "hideAddSongsForm"
      "submit .song-creator" : "addSong"
      "keypress input.title" : "update"

    initialize: ->
      @model.on "destroy", @removeView, @
      @model.on "add:model", @addSongView, @

    render: ->
      renderedContent = playlistTemplate['playlist.hbs'](name: @model.get('name'), id: @model.id)
      @$el.html(renderedContent)
      
      playlistSongs = @model.get("songs")
      playlistSongs.forEach (song) =>
        @model.addSong song
      @

    delete: (evt) ->
      @model.destroy()

    removeView: ->
      @remove()

    edit: ->
      @inputEdit = @$('input.title').show()
      @spanEdit = @$('span.title').hide()
      
    showAddSongsForm: ->
      @addSongsForm ?= @$ ".song-creator"
      @addSongsForm.show()
      
    hideAddSongsForm: ->
      @addSongsForm.hide()
      
    addSong: (evt) ->
      evt.preventDefault()
      
      artistInput = @$("input.artist")
      songInput = @$("input.song")
      
      @model.addSongAndSave artist: artistInput.val(), song: songInput.val()
      artistInput.val("")
      songInput.val("")
      
    addSongView: ->
      @songs ?= @$ ".songs"
      @songs.empty()
      @model.songs.forEach (song) =>
        songView = new SongView model: song
        @songs.append songView.render().el
      
    addSongToPlaylist: ->
      console.log "adding songs to playlist"

    update: (evt) ->
      unless evt.which is 13
        return

      newTitle = @inputEdit.val()
      unless $.trim(newTitle) is ""
        @spanEdit.text newTitle
        @model.set('title', newTitle)
        @model.save()

      @inputEdit.hide()
      @spanEdit.show()
