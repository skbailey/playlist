define ["jquery", "backbone", "templates/playlist"], ($, Backbone, playlistTemplate) ->

  class PlaylistView extends Backbone.View

    tagName: "li"
    events:
      "click .icon-trash"    : "delete"
      "click .icon-edit"     : "edit"
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
