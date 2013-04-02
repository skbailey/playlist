// Generated by CoffeeScript 1.6.2
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["jquery", "backbone", "collections/songs"], function($, Backbone, SongsCollection) {
    var PlaylistModel, _ref;

    return PlaylistModel = (function(_super) {
      __extends(PlaylistModel, _super);

      function PlaylistModel() {
        _ref = PlaylistModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      PlaylistModel.prototype.idAttribute = "_id";

      PlaylistModel.prototype.initialize = function() {
        return this.on("sync", this.createSongsCollection, this);
      };

      PlaylistModel.prototype.validate = function(attrs, options) {
        if ($.trim(attrs.title) === "") {
          return "You must enter a name for the playlist!";
        }
      };

      PlaylistModel.prototype.addSong = function(song) {
        return this.songs.create(song);
      };

      PlaylistModel.prototype.createSongsCollection = function() {
        this.songs = new SongsCollection(null, {
          playlistID: this.id
        });
        return this.songs.on("all", this.bubbleEvents, this);
      };

      PlaylistModel.prototype.bubbleEvents = function(eventName) {
        return this.trigger("" + eventName + ":model");
      };

      PlaylistModel.prototype.getLastSong = function() {
        return this.songs.last();
      };

      return PlaylistModel;

    })(Backbone.Model);
  });

}).call(this);
