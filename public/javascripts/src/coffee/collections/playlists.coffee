define ["backbone", "models/playlist"], (Backbone, PlaylistModel) ->

  class PlaylistCollection extends Backbone.Collection

    model: PlaylistModel
    url: "/playlists"
