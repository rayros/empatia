window.fbAsyncInit = ->
  FB.init
    appId: $('#fb-root').data('id')
    xfbml: true
    version: "v2.0"

  get = (url) ->
    $.get url + "/fb_update", (data) ->
      if data and data.response
        console.log data.responseText
      else
        console.log data
      return

    return

  fb_like = (url, html_element) ->
    get url
    return

  FB.Event.subscribe "edge.create", fb_like
  FB.Event.subscribe "edge.remove", fb_like
  fb_comment = (response) ->
    get response.href
    return

  FB.Event.subscribe "comment.create", fb_comment
  FB.Event.subscribe "comment.remove", fb_comment
  return

((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  return  if d.getElementById(id)
  js = d.createElement(s)
  js.id = id
  js.src = "//connect.facebook.net/en_US/sdk.js"
  fjs.parentNode.insertBefore js, fjs
  return
) document, "script", "facebook-jssdk"
