Playlist = require('../../models/playlist')

module.exports = (app) ->

  app.post "/playlists", (req, res) ->
    console.log "Store the new playlist", req.body.title
    playlist = new Playlist(title: req.body.title)
    playlist.save (err, newPlaylist) ->
      res.json(newPlaylist)

  app.del "/playlists/:id", (req, res) ->
    console.log "Delete playlist", req.params.id
    Playlist.findById req.params.id, (err, playlist) ->
      res.send(200)

  app.put "/playlists/:id", (req, res) ->
    console.log "Update playlist", req.params.id
    Playlist.update {id: req.params.id}, {title: req.body.title}
