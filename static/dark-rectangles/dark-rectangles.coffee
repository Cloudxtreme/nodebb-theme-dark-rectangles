###
  Credits to psychobunny and barisusakli for their lavender.js:
    https://github.com/designcreateplay/nodebb-theme-lavender/blob/master/static/lib/lavender.js
###

loadingbar = true
masonry = true
homeCategoryPositionAnimated = true

# Load scripts
$(document).ready ->
  requirejs [
    '/css/assets/dark-rectangles/masonry.js' if masonry
    '/css/assets/dark-rectangles/loadingbar.js' if loadingbar
  ]