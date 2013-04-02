require.config
  paths:
    jquery: "../../lib/jquery"
    underscore: "../../lib/underscore"
    backbone: "../../lib/backbone"
    handlebars: "../../lib/handlebars.runtime"

  shim:
    jquery:
      exports: "$"
    handlebars:
      exports: "Handlebars"
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore"]
      exports: "Backbone"

require ["jquery", "views/main"], ($, MainView) ->
  $ ->
    mainview = new MainView

