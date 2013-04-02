define(['handlebars'], function(Handlebars) {

this["JST"] = this["JST"] || {};

this["JST"]["song.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "\n  <li class=\"song\">\n  	<i class=\"icon-trash remove-song\"></i>\n  	<dl>\n  		<dt>Artist: </dt>\n  		<dd>";
  if (stack1 = helpers.artist) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.artist; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</dd>\n  		<dt>Song: </dt>\n  		<dd>";
  if (stack1 = helpers.song) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.song; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</dd>\n  	</dl>\n  </li>";
  return buffer;
  });

return this["JST"];

});