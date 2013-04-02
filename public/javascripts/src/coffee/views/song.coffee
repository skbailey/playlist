define ["jquery", "backbone", "templates/song"], ($, Backbone, songTemplate) ->
  
  class SongView extends Backbone.View
    
    tagName: "li"
    
    render: ->
      renderedContent = songTemplate['song.hbs']
        artist: @model.get('artist')
        song: @model.get('song')
        
      @$el.html(renderedContent)
      @