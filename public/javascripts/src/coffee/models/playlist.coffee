define ["backbone"], (Backbone) ->
  
  class PlaylistModel extends Backbone.Model

    idAttribute: "_id"

    validate: (attrs, options) ->
      if attrs.title is ""
        "You must enter a name for the playlist!"