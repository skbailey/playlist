define ["backbone"], (Backbone) ->
  
  class PlaylistModel extends Backbone.Model

    validate: (attrs, options) ->
      if attrs.title is ""
        "You must enter a name for the playlist!"