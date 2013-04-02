Playlist = require('../../models/playlist')

module.exports = (app) ->
  
  app.get "/playlists", (req, res) ->
    console.log "get all playlists"
    Playlist.find {}, (err, users) ->
      console.log "all users"
      res.json users

  app.post "/playlists", (req, res) ->
    console.log "Store the new playlist", req.body.title
    playlist = new Playlist(name: req.body.title)
    playlist.save (err, newPlaylist) ->
      res.json(newPlaylist)

  app.del "/playlists/:id", (req, res) ->
    console.log "Delete playlist", req.params.id
    Playlist.findById req.params.id, (err, playlist) ->
      res.send(200)

  app.put "/playlists/:id", (req, res) ->
    console.log "Update playlist", req.params.id
    Playlist.update {id: req.params.id}, {title: req.body.title}, ->
      res.send(200)

  app.post "/playlists/:id/songs", (req, res) ->
    console.log "Add songs to playlist"
    Playlist.findById req.params.id, (err, playlist) ->
      playlist.songs.push artist: req.body.artist, song: req.body.title
      playlist.save (err) ->
        res.json playlist.songs
