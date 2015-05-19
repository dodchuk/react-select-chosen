module.exports = (grunt) ->
  grunt.initConfig
    clean:
      all: [ 'build' ]

    cjsx:
      compile:
        expand: true
        cwd: 'src'
        src: [ '**/*.cjsx' ]
        dest: 'build'
        ext: '.js'

    watch:
      cjsx:
        files: [ 'src/**/*.cjsx' ]
        tasks: [ 'cjsx' ]

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffee-react'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'scripts',  'Compiles the JavaScript files.', [ 'cjsx' ]
  grunt.registerTask 'build', 'Compiles all of the assets to the build directory.', [ 'clean', 'scripts' ]

  grunt.registerTask 'default', [ 'build' ]
