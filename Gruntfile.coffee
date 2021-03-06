module.exports = (grunt)->
  SRC_DIR = "sass"
  SVG_DIR = "flags"
  TARGET_DIR = "css"

  grunt.initConfig
    less:
      app_css:
        src: "#{SRC_DIR}/flag-icon.less"
        dest: "#{TARGET_DIR}/flag-icon.css"

    sass:
      app_css:
        src: "#{SRC_DIR}/flag-icon.scss"
        dest: "#{TARGET_DIR}/flag-icon.css"

    imagemin: 
      static:
        files: "#{SVG_DIR}/**/*.svg"


    cssmin:
      app_css:
        src: "#{TARGET_DIR}/flag-icon.css"
        dest: "#{TARGET_DIR}/flag-icon.min.css"

    watch:
      css:
        options:
          livereload: true
        files: "#{SRC_DIR}/*.less"
        tasks: ["build"]

      assets:
        options:
          livereload: true
        files: ['index.html', 'assets/*']

    connect:
      server:
        options:
          port: 8000
          keepalive: true


    grunt.loadNpmTasks("grunt-contrib-sass")
    grunt.loadNpmTasks("grunt-contrib-cssmin")
    grunt.loadNpmTasks('grunt-contrib-imagemin')
    grunt.loadNpmTasks("grunt-contrib-watch")
    grunt.loadNpmTasks('grunt-contrib-connect')

    grunt.registerTask("default", ["build", "watch"])
    grunt.registerTask("build", ["imagemin", "sass", "cssmin"])
