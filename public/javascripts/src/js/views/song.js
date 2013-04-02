// Generated by CoffeeScript 1.6.2
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["jquery", "backbone", "templates/song"], function($, Backbone, songTemplate) {
    var SongView, _ref;

    return SongView = (function(_super) {
      __extends(SongView, _super);

      function SongView() {
        _ref = SongView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      SongView.prototype.tagName = "li";

      SongView.prototype.events = {
        "click .remove-song": "delete"
      };

      SongView.prototype.initialize = function() {
        return this.model.on("destroy", this.removeView, this);
      };

      SongView.prototype.render = function() {
        var renderedContent;

        renderedContent = songTemplate['song.hbs']({
          artist: this.model.get('artist'),
          song: this.model.get('song')
        });
        this.$el.html(renderedContent);
        return this;
      };

      SongView.prototype["delete"] = function(evt) {
        this.model.destroy();
        return false;
      };

      SongView.prototype.removeView = function() {
        return this.remove();
      };

      return SongView;

    })(Backbone.View);
  });

}).call(this);