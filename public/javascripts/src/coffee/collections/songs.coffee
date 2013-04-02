define ["backbone", "models/song"], (Backbone, SongModel) ->
  
  class SongCollection extends Backbone.Collection
    
    model: SongModel
    
    initialize: (models, options) ->
      @url = "/playlists/#{options.playlistID}/songs"