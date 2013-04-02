define [
  "jquery", 
  "backbone", 
  "templates/playlist",
  "models/song",
  ], ($, Backbone, playlistTemplate, SongModel) ->

  class PlaylistView extends Backbone.View

    tagName: "li"
    events:
      "click .icon-trash" : "delete"
      "click .icon-edit" : "edit"
      "click .icon-plus" : "showAddSongsForm"
      "click .song-creator .icon-remove" : "hideAddSongsForm"
      "submit .song-creator" : "addSong"
      "keypress input.title" : "update"

    initialize: ->
      @model.on "destroy", @removeView, @

    render: ->
      renderedContent = playlistTemplate['playlist.hbs'](title: @model.get('title'))
      @$el.html(renderedContent)
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
      
      artist = @$("input.artist")
      song = @$("input.song")
      
      

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
