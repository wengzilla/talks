class @YouTube
  constructor: ->
    @_addScriptTags()
    $(window).bind("videoReady", (e, p) => @_wireup(p))
    

  _addScriptTags: ->
    tag = document.createElement("script")
    tag.src = "https://www.youtube.com/player_api"
    firstScriptTag = document.getElementsByTagName("script")[0]
    firstScriptTag.parentNode.insertBefore tag, firstScriptTag

  _wireup: (p) ->
    @video_player = p
    @_logActions()
    $(window).bind("videoGetCurrentTime", @_getCurrentTime)

  _logActions: =>
    # setInterval(@_getCurrentTime, 1000)
    
  _getCurrentTime: =>
    $(window).trigger("videoCurrentTime", @video_player.getCurrentTime())

  window.onYouTubePlayerAPIReady = =>
    player = new YT.Player('ytplayer', {
      height: '390',
      width: '640',
      videoId: 'u1zgFlCw8Aw'
    })
    $(window).trigger("videoReady", player)

window.yt = new YouTube()