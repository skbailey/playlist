module.exports = (app) ->

	app.get "/", (req, res) ->
		res.render "#{__dirname}/views/index",
			title: "Playlists in the Cloud"