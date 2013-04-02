// Generated by CoffeeScript 1.6.2
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["backbone", "models/song"], function(Backbone, SongModel) {
    var SongCollection, _ref;

    return SongCollection = (function(_super) {
      __extends(SongCollection, _super);

      function SongCollection() {
        _ref = SongCollection.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      SongCollection.prototype.model = SongModel;

      SongCollection.prototype.initialize = function(models, options) {
        return this.url = "/playlists/" + options.playlistID + "/songs";
      };

      return SongCollection;

    })(Backbone.Collection);
  });

}).call(this);
