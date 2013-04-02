define ["backbone", "templates/playlist"], (Backbone, playlistTemplate) ->

  class PlaylistView extends Backbone.View

    tagName: "li"

    render: ->
      renderedContent = playlistTemplate['playlist.hbs'](title: @model.get('title'))
      @$el.html(renderedContent)
      @