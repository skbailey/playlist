// Generated by CoffeeScript 1.6.2
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "collections/playlists", "views/playlist", "views/song"], function($, _, Backbone, PlaylistCollection, PlaylistView, SongView) {
    var MainView, _ref;

    return MainView = (function(_super) {
      __extends(MainView, _super);

      function MainView() {
        _ref = MainView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      MainView.prototype.el = "#container";

      MainView.prototype.events = {
        "submit #playlist-creator form": "createPlaylist"
      };

      MainView.prototype.initialize = function() {
        this.collection = new PlaylistCollection;
        this.collection.on("invalid", this.showPlaylistSaveError, this);
        this.collection.on("sync", this.loadPlaylists, this);
        return this.collection.fetch();
      };

      MainView.prototype.createPlaylist = function(evt) {
        var nameInput;

        evt.preventDefault();
        nameInput = $(evt.target).find('.name');
        this.collection.create({
          title: nameInput.val()
        });
        return nameInput.val("");
      };

      MainView.prototype.loadPlaylists = function() {
        var _ref1,
          _this = this;

        if ((_ref1 = this.playlists) == null) {
          this.playlists = this.$("#playlists");
        }
        return this.collection.forEach(function(model) {
          _this.playlistView = new PlaylistView({
            model: model
          });
          return _this.playlists.append(_this.playlistView.render().el);
        });
      };

      MainView.prototype.showPlaylistSaveError = function(model, error) {
        return alert(error);
      };

      return MainView;

    })(Backbone.View);
  });

}).call(this);
