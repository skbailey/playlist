define ["jquery", "backbone"], ($, Backbone) ->
  
  class PlaylistModel extends Backbone.Model

    idAttribute: "_id"

    validate: (attrs, options) ->
      if $.trim(attrs.title) is ""
        "You must enter a name for the playlist!"