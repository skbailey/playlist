require.config
  paths:
    jquery: "../../lib/jquery"
    underscore: "../../lib/underscore"
    backbone: "../../lib/backbone"

  shim:
    jquery:
      exports: "$"
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore"]
      exports: "Backbone"

require ["jquery", "views/main"], ($, MainView) ->
  $ ->
    console.log "Page loaded"
    mainview = new MainView

