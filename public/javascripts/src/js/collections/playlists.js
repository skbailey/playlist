// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["backbone", "models/playlist"], function(Backbone, PlaylistModel) {
    var PlaylistCollection;
    return PlaylistCollection = (function(_super) {

      __extends(PlaylistCollection, _super);

      function PlaylistCollection() {
        return PlaylistCollection.__super__.constructor.apply(this, arguments);
      }

      PlaylistCollection.prototype.model = PlaylistModel;

      PlaylistCollection.prototype.url = "/playlists";

      return PlaylistCollection;

    })(Backbone.Collection);
  });

}).call(this);