class @Sync
  constructor: (transitions) ->
    # JSON of slide transitions. e.g., [{time: 0, slide: 1], 
    # {time: 10, slide: 2}, {time: 30, slide: 3}]
    @transitions = transitions
    $(window).bind("videoReady", @_getCurrentTimeOnInterval)
    $(window).bind("videoCurrentTime", (e, time) => @_transitionOnTime(time))

  _getCurrentTimeOnInterval: =>
    setInterval((->
      $(window).trigger("videoGetCurrentTime")
      ), 1000
    )

  _transitionOnTime: (time) =>
    transition = @_findTransitionByTime(time)
    console.log(transition.slide)
    $(window).trigger("goToSlide", transition.slide)

  _findTransitionByTime: (time) =>
    slides = _.filter(@transitions, (transition, idx) =>
      transition.time <= time
    )
    slide = _.last(slides)

  _findTransitionBySlide: (slide) ->
    slides = 1

sync = new Sync([{'time': 0, 'slide': 1}, {'time': 5, 'slide': 37}, {'time': 10, 'slide': 30}])