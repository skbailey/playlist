define ["backbone", "templates/playlist"], (Backbone, playlistTemplate) ->

  class PlaylistView extends Backbone.View

    tagName: "li"
    events:
      "click .icon-trash" : "delete"

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
