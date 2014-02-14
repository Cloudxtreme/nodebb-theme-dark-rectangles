( ->
  ajaxifyGo = ajaxify.go
  loadTemplates = templates.load_template
  refreshTitle = app.refreshTitle
  loadingBar = $ '.loading-bar'

  ajaxify.go = (url, cb, quiet) ->
    loadingBar.addClass('reset').css 'width', '100%'
    ajaxifyGo url, cb, quiet

  templates.load_template = (cb, url, tpl) ->
    setTimeout ->
      loadingBar.removeClass('reset').css 'width', "#{Math.random()*25+5}%"
    , 10
    loadTemplates cb, url, tpl

  app.refreshTitle = (url) ->
    setTimeout (-> loadingBar.css 'width', '0'), 300
    refreshTitle url
)()