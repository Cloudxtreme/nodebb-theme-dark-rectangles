###
  Credits to psychobunny and barisusakli for their lavender.js:
    https://github.com/designcreateplay/nodebb-theme-lavender/blob/master/static/lib/lavender.js
###

useLoadingBar = true
masonry = true
homeAnimated = true

if masonry && !/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test navigator.userAgent
  requirejs [
      'dark-rectangles/masonry'
      'dark-rectangles/imagesloaded'
  ], (Masonry) ->
    m = null
    $(window).on 'action:ajaxify.end', (e, data) -> if data.url == '' && $('.home').length
      m = new Masonry '.row.home > div',
        itemSelector: '.category-item'
        columnWidth: '.category-item'
        transitionDuration: if homeAnimated then '0.4s' else 0
      m.layout()
      $('.row.home > div img').imagesLoaded -> m?.layout()
    $(window).on 'action:widgets.loaded', -> m?.layout() if $('.home').length

if useLoadingBar
  go = ajaxify.go
  loadTemplates = templates.load_template
  refreshTitle = app.refreshTitle
  useLoadingBar = $ '.loading-bar'

  ajaxify.go = (url, cb, quiet) ->
    useLoadingBar.addClass('reset').css 'width', '100%'
    go url, cb, quiet

  templates.load_template = (cb, url, tpl) ->
    setTimeout ->
      useLoadingBar.removeClass('reset').css 'width', "#{Math.random() * 25 + 5}%"
    , 10
    loadTemplates cb, url, tpl

  app.refreshTitle = (url) ->
    setTimeout (->
      useLoadingBar.css 'width', '0'), 300
    refreshTitle url