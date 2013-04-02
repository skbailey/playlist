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

require ["jquery"], ($) ->
  $ ->
    console.log "Page loaded"

