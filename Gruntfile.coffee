module.exports = (grunt) ->

  # Project Configuration
  grunt.initConfig
    handlebars:
      compile:
        options:
          namespace: "JST"
          amd: true
          processName: (filename) ->
            filename.split("/").pop()
        files:
          "public/javascripts/src/js/templates/playlist.js" : "public/javascripts/templates/playlist.hbs"
          "public/javascripts/src/js/templates/song.js" : "public/javascripts/templates/song.hbs"

  grunt.loadNpmTasks('grunt-contrib-handlebars')

  grunt.registerTask('default', ['handlebars']);