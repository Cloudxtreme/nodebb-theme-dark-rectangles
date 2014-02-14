(->
  return if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test navigator.userAgent
  requirejs [
    '/css/assets/dark-rectangles/lib/masonry.pkgd.min.js'
    '/css/assets/dark-rectangles/lib/imagesloaded.pkgd.min.js'
  ], (Masonry) ->
    $(document).bind 'DOMNodeInserted', (e) ->
      if e.target.id == 'categories-wrapper'
        setTimeout ->
          categories = $ '#categories', e.target
          m = new Masonry categories[0],
            itemSelector: '.category-item'
            columnWidth: '.category-item'
            transitionDuration: if homeCategoryPositionAnimated then '0.4s' else 0
          categories.imagesLoaded -> m.layout()
        , 50
)()