$(document).bind 'DOMNodeInserted', (e) ->
  return if e.target.id != 'categories-wrapper'

  $.get RELATIVE_PATH + '/api/recent/month', {}, (posts) ->
    replies = $ '#category_recent_replies'
    if !posts || !posts.topics || !posts.topics.length
      replies.html 'No topics have been posted yet.'
      return;
    posts = posts.topics.slice 0, maxRecentReplies
    repliesHTML = ''
    for post in posts
      repliesHTML +=
      """
        <li data-pid="#{post.pid}" class="clearfix">
          <a href="#{RELATIVE_PATH}/user/#{post.teaser_userslug}"><img title="#{post.teaser_username}" class="img-rounded user-img" src="#{post.teaser_userpicture}" /></a>
          <p>
            <strong><span>#{post.teaser_username}</span></strong>
            <span> [[global:posted]] [[global:in]] </span>
            <a href="#{RELATIVE_PATH}/topic/#{post.slug}##{post.teaser_pid}">#{post.title}</a>
          </p>
          <span class="pull-right">
            <span class="timeago" title="#{utils.toISOString post.lastposttime}"></span>
          </span>
        </li>
        """
    translator.translate repliesHTML, (html) ->
      replies.html html
      $('span.timeago', replies).timeago()
      app.createUserTooltips()