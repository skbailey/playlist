module.exports = (app) ->

  app.post "/playlists", (req, res) ->
    console.log "Store the new playlist", req.body.title
    res.send(200)
