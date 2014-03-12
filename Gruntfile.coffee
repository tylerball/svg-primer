module.exports = (grunt) ->

  port = grunt.option('port') || 8000

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    meta:
      banner:
        '/*!\n' +
        ' * reveal.js <%= pkg.version %> (<%= grunt.template.today("yyyy-mm-dd, HH:MM") %>)\n' +
        ' * http://lab.hakim.se/reveal-js\n' +
        ' * MIT licensed\n' +
        ' *\n' +
        ' * Copyright (C) 2013 Hakim El Hattab, http://hakim.se\n' +
        ' */'

    qunit:
      files: [ 'test/*.html' ]

    swig:
      dev:
        dest: '.'
        src: [
          'templates/**/*.swig',
          '!**/_*.swig',
          '!**/',
        ]
        DEVELOPMENT: true


    uglify:
      options:
        banner: '<%= meta.banner %>\n'
      build:
        src: 'js/reveal.js',
        dest: 'js/reveal.min.js'

    cssmin:
      compress:
        files:
          'css/reveal.min.css': [ 'css/reveal.css' ]

    sass:
      main:
        files:
          'css/theme/svg.css': 'css/theme/source/svg.scss'

    myth:
      main:
        files:
          'css/theme/svg.css': 'css/theme/svg.css'


    jshint:
      options:
        curly: false,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        eqnull: true,
        browser: true,
        expr: true,
        globals:
          head: false,
          module: false,
          console: false,
          unescape: false
      files: [ 'Gruntfile.js', 'js/reveal.js' ]

    connect:
      server:
        options:
          port: port,
          base: '.'

    zip:
      'reveal-js-presentation.zip': [
        'index.html',
        'css/**',
        'js/**',
        'lib/**',
        'images/**',
        'plugin/**'
      ]

    watch:
      main:
        files: [ 'Gruntfile.js', 'js/reveal.js', 'css/reveal.css' ],
        tasks: 'default'
      theme:
        files: [ 'css/theme/source/*.scss', 'css/theme/template/*.scss' ],
        tasks: ['themes', 'myth']
        options:
          livereload: true
      swig:
        files: ['**/*.swig']
        tasks: 'swig'
        options:
          livereload: true

    'gh-pages':
      options:
        base: '.'
      src: [
        '**/*.html',
        'css/**',
        'js/**',
        'img/**',
        'lib/**',
        'plugin/**',
      ]

  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-myth'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-zip'
  grunt.loadNpmTasks 'grunt-swig'
  grunt.loadNpmTasks 'grunt-gh-pages'

  grunt.registerTask( 'default', [ 'jshint', 'cssmin', 'uglify', 'qunit' ] )

  grunt.registerTask( 'themes', [ 'sass' ] )

  grunt.registerTask( 'package', [ 'default', 'zip' ] )

  # Serve presentation locally
  grunt.registerTask( 'serve', [ 'connect', 'swig', 'watch' ] )

  # Run tests
  grunt.registerTask( 'test', [ 'jshint', 'qunit' ] )
