define(['handlebars'], function(Handlebars) {

this["JST"] = this["JST"] || {};

this["JST"]["playlist.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<li class=\"playlist\" data-id=\"";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n  <h3>\n    <span class=\"title\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span> \n    <input class=\"title\" type=\"text\" placeholder=\"";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n    <span class=\"controls\">\n      <i class=\"icon-plus\"></i>\n      <i class=\"icon-edit\"></i>\n      <i class=\"icon-trash remove-playlist\"></i>\n    </span>\n  </h3>\n  <form action=\"playlists/name/songs\" method=\"post\" class=\"song-creator\">\n    <i class=\"icon-remove\"></i>\n    <fieldset>\n      <legend>Add Song</legend>\n      <label>Artist:<input class=\"artist\" type=\"text\" placeholder=\"Artist\"></label>\n      <label>Song:<input class=\"song\" type=\"text\" placeholder=\"Song\"></label>\n      <input type=\"submit\" value=\"Add Song\" class=\"btn pull-right\">\n    </fieldset>\n  </form>\n  <ol class=\"songs\"></ol>\n</li>";
  return buffer;
  });

return this["JST"];

});