class @SpeakerDeck
  constructor: ->
    $(window).bind("presentationReady", (e, p) => @_wireup(p))
    $(window).bind("nextSlide", @_nextSlide)
    $(window).bind("previousSlide", @_previousSlide)
    $(window).bind("goToSlide", (e, slide) => @_goToSlide(slide))
    $(window).bind("getCurrentSlide", @_currentSlide)

  window.onSpeakerDeckPlayerReady = (p) =>
    $(window).trigger("presentationReady", p)

  _wireup: (p) =>
    @presentation_player = p
    @_logActions
    @presentation_player.on('change', (slide) ->
      $(window).trigger("slideChange", slide.number)
    )

  # _nextSlide: =>
  #   @presentation_player.nextSlide()

  # _previousSlide: =>
  #   @presentation_player.previousSlide()

  _goToSlide: (slide) =>
    unless slide.number == @presentation_player.currentSlide.number
      @presentation_player.goToSlide(slide)

  _logActions: =>
    #

window.sd = new SpeakerDeck()

# // After player is ready
 
# player.nextSlide();
# player.previousSlide();
# player.goToSlide(5);
# player.currentSlide // returns {"number": 5}
 
# player.on('change', function(slide) {
#   console.log('changed to slide ' + slide.number);
# });