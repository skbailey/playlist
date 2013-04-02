// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "collections/playlists", "views/playlist"], function($, _, Backbone, PlaylistCollection, PlaylistView) {
    var MainView;
    return MainView = (function(_super) {

      __extends(MainView, _super);

      function MainView() {
        return MainView.__super__.constructor.apply(this, arguments);
      }

      MainView.prototype.el = "#container";

      MainView.prototype.events = {
        "click .create-playlist": "showCreatePlaylistForm",
        "submit #playlist-creator form": "createPlaylist"
      };

      MainView.prototype.initialize = function() {
        this.collection = new PlaylistCollection;
        this.collection.on("invalid", this.showPlaylistSaveError, this);
        return this.collection.on("sync", this.appendPlaylist, this);
      };

      MainView.prototype.showCreatePlaylistForm = function(evt) {
        var _ref;
        if ((_ref = this.createPlaylistForm) == null) {
          this.createPlaylistForm = this.$("#playlist-creator form");
        }
        return this.createPlaylistForm.addClass("show");
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

      MainView.prototype.appendPlaylist = function() {
        var _ref;
        if ((_ref = this.playlists) == null) {
          this.playlists = this.$("#playlists");
        }
        this.playlistView = new PlaylistView({
          model: this.collection.last()
        });
        return this.playlists.append(this.playlistView.render().el);
      };

      MainView.prototype.showPlaylistSaveError = function(model, error) {
        return alert(error);
      };

      return MainView;

    })(Backbone.View);
  });

}).call(this);
