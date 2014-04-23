Theme =
  defineWidgetAreas: (areas, callback) ->
    areas = areas.concat [
      'name': 'Homepage Sidebar'
      'template': 'home.tpl'
      'location': 'sidebar'
    ]
    callback null, areas


module.exports = Theme