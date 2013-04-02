Playlist = require('../../models/playlist')

module.exports = (app) ->
  
  app.get "/playlists", (req, res) ->
    Playlist.find {}, (err, users) ->
      console.log "all users"
      res.json users

  app.post "/playlists", (req, res) ->
    playlist = new Playlist(name: req.body.title)
    playlist.save (err, newPlaylist) ->
      res.json(newPlaylist)

  app.del "/playlists/:id", (req, res) ->
    Playlist.findById req.params.id, (err, playlist) ->
      playlist.remove (err) ->
        res.send(200)

  app.put "/playlists/:id", (req, res) ->
    console.log "name", req.body.title
    Playlist.update {name: req.body.name}, {name: req.body.title}, (err, numberAffected) ->
      console.log "#{numberAffected} lines updated"
      res.send(200)

  app.post "/playlists/:id/songs", (req, res) ->
    Playlist.findById req.params.id, (err, playlist) ->
      playlist.songs.push artist: req.body.artist, song: req.body.song
      playlist.save (err) ->
        res.json playlist.songs
