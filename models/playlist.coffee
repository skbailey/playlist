mongoose = require('mongoose')

SongSchema = new mongoose.Schema
  artist: String
  song: String

PlaylistSchema = new mongoose.Schema
  name: String
  songs: [SongSchema]
  
module.exports = mongoose.model "Playlist", PlaylistSchema