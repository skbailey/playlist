define ["backbone", "templates/playlist"], (Backbone, playlistTemplate) ->

  class PlaylistView extends Backbone.View

    render: ->
      renderedContent = window.JST['playlist.hbs'](title: @model.get('title'))
      @$el.html(renderedContent)