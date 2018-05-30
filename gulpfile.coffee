browser_sync = require("browser-sync").create()
del = require "del"
gulp = require "gulp"
gulp_autoprefixer = require "gulp-autoprefixer"
gulp_coffee = require "gulp-coffee"
gulp_concat = require "gulp-concat"
gulp_notify = require "gulp-notify"
gulp_uglify = require "gulp-uglify"


paths =
  coffee: "source/script/**/*.coffee"
  html: "source/index.html"
  scss: [
    "source/**/vars.scss"
    "source/style/**/*.scss"
  ]


gulp_notify.logLevel(0)


logAndKillError = (err)->
  console.log "\n## Error ##"
  console.log err.toString() + "\n"
  gulp_notify.onError(
    emitError: true
    icon: false
    message: err.message
    title: "👻"
    wait: true
    )(err)
  @emit "end"


gulp.task "coffee", ()->
  gulp.src paths.coffee
    .pipe gulp_concat "script.coffee"
    .pipe gulp_coffee()
    # .pipe gulp_uglify()
    .on "error", logAndKillError
    .pipe gulp.dest "public"
    .pipe browser_sync.stream
      match: "**/*.js"


gulp.task "del:public", ()->
  del "public"


gulp.task "html", ()->
  gulp.src paths.html
    .pipe gulp.dest "public"
    .pipe browser_sync.stream
      match: "**/*.html"


gulp.task "serve", ()->
  browser_sync.init
    ghostMode: false
    online: true
    server:
      baseDir: "public"
    ui: false


gulp.task "watch", (cb)->
  gulp.watch paths.coffee, gulp.series "coffee"
  gulp.watch paths.html, gulp.series "html"
  cb()


gulp.task "default", gulp.series "del:public", gulp.parallel("coffee", "html"), "watch", "serve"
