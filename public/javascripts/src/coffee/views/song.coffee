define ["jquery", "backbone", "templates/song"], ($, Backbone, songTemplate) ->
  
  class SongView extends Backbone.View
    
    tagName: "li"
    
    events:
      "click .remove-song" : "delete"
      
    initialize: ->
      @model.on "destroy", @removeView, @
    
    render: ->
      renderedContent = songTemplate['song.hbs']
        artist: @model.get('artist')
        song: @model.get('song')
        
      @$el.html(renderedContent)
      @
      
    delete: (evt) ->
      @model.destroy()
      false
      
    removeView: ->
      @remove()